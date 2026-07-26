import 'dart:async';

import 'package:dio/dio.dart';
import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/error/failure_mapper.dart';
import 'package:github_repository_explorer/core/logging/app_logger.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/mappers/repository_mapper.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';

const _repositorySearchPageSize = 30;

final class RepositorySearchRepositoryImpl
    implements RepositorySearchRepository {
  RepositorySearchRepositoryImpl({
    required GithubRemoteDataSource remote,
    required RepositoryLocalDataSource local,
    required CachePolicy cachePolicy,
    required Clock clock,
    required AppLogger logger,
  }) : _remote = remote,
       _local = local,
       _cachePolicy = cachePolicy,
       _clock = clock,
       _logger = logger;

  final GithubRemoteDataSource _remote;
  final RepositoryLocalDataSource _local;
  final CachePolicy _cachePolicy;
  final Clock _clock;
  final AppLogger _logger;
  DateTime? _rateLimitedUntil;

  @override
  Stream<Result<RepositoryPage>> search(
    RepositorySearchRequest request,
  ) {
    final cancelToken = CancelToken();
    late final StreamController<Result<RepositoryPage>> controller;
    controller = StreamController<Result<RepositoryPage>>(
      onListen: () {
        unawaited(_runSearch(request, cancelToken, controller));
      },
      onCancel: () {
        if (!cancelToken.isCancelled) {
          cancelToken.cancel('Search superseded.');
        }
      },
    );
    return controller.stream;
  }

  Future<void> _runSearch(
    RepositorySearchRequest request,
    CancelToken cancelToken,
    StreamController<Result<RepositoryPage>> controller,
  ) async {
    try {
      CachedRepositoryPage? cached;
      try {
        cached = await _local.readPage(
          query: request.query,
          page: request.page,
        );
        if (!_isActive(cancelToken, controller)) return;
        if (cached != null && !request.forceRefresh) {
          final cachedPage = _cachedPageToDomain(cached);
          controller.add(Result.success(cachedPage));
          if (!cachedPage.isStale) return;
        }
      } on CacheException {
        cached = null;
      }

      final blockedUntil = request.forceRefresh ? null : _activeRateLimit();
      if (blockedUntil != null) {
        final failure = Failure.rateLimited(retryAt: blockedUntil);
        if (cached != null) {
          controller.add(
            Result.success(
              _cachedPageToDomain(cached).copyWith(refreshFailure: failure),
            ),
          );
        } else {
          controller.add(Result.failure(failure));
        }
        return;
      }

      try {
        final response = await _remote.search(
          query: request.query,
          page: request.page,
          pageSize: _repositorySearchPageSize,
          cancelToken: cancelToken,
        );
        if (!_isActive(cancelToken, controller)) return;
        final now = _clock.now();
        final repositories = response.repositories
            .map((dto) => dto.toDomain())
            .toList(growable: false);
        final cachePage = CachedRepositoryPage(
          repositories: repositories
              .map((repository) => repository.toCache(now))
              .toList(growable: false),
          page: request.page,
          hasNextPage: response.hasNextPage,
          fetchedAt: now,
        );
        try {
          await _local.writePage(query: request.query, page: cachePage);
          if (!_isActive(cancelToken, controller)) return;
          await _local.prune(olderThan: now.subtract(_cachePolicy.retainFor));
        } on CacheException {
          // A cache write must not hide a valid network response.
        }
        if (!_isActive(cancelToken, controller)) return;
        controller.add(
          Result.success(
            RepositoryPage(
              repositories: repositories,
              page: request.page,
              hasNextPage: response.hasNextPage,
              origin: DataOrigin.network,
              fetchedAt: now,
            ),
          ),
        );
      } on DioException catch (error) {
        if (CancelToken.isCancel(error)) return;
        rethrow;
      } on AppException catch (error) {
        if (!_isActive(cancelToken, controller)) return;
        final failure = mapExceptionToFailure(error);
        _rememberRateLimit(failure);
        _addFailure(controller, cached, failure);
      } on Exception catch (error, stackTrace) {
        if (!_isActive(cancelToken, controller)) return;
        _logger.error(
          'Unexpected repository search failure.',
          error: error,
          stackTrace: stackTrace,
        );
        _addFailure(controller, cached, const Failure.unexpected());
      }
    } finally {
      if (!controller.isClosed) {
        unawaited(controller.close());
      }
    }
  }

  bool _isActive(
    CancelToken cancelToken,
    StreamController<Result<RepositoryPage>> controller,
  ) =>
      !cancelToken.isCancelled &&
      !controller.isClosed &&
      controller.hasListener;

  void _addFailure(
    StreamController<Result<RepositoryPage>> controller,
    CachedRepositoryPage? cached,
    Failure failure,
  ) {
    if (cached != null) {
      controller.add(
        Result.success(
          _cachedPageToDomain(cached).copyWith(refreshFailure: failure),
        ),
      );
    } else {
      controller.add(Result.failure(failure));
    }
  }

  DateTime? _activeRateLimit() {
    final retryAt = _rateLimitedUntil;
    if (retryAt == null) return null;
    if (!_clock.now().isBefore(retryAt)) {
      _rateLimitedUntil = null;
      return null;
    }
    return retryAt;
  }

  void _rememberRateLimit(Failure failure) {
    if (failure case RateLimitedFailure(retryAt: final retryAt?)) {
      final retryAtUtc = retryAt.toUtc();
      final current = _rateLimitedUntil;
      if (_clock.now().isBefore(retryAtUtc) &&
          (current == null || retryAtUtc.isAfter(current))) {
        _rateLimitedUntil = retryAtUtc;
      }
    }
  }

  RepositoryPage _cachedPageToDomain(CachedRepositoryPage page) {
    final now = _clock.now();
    return RepositoryPage(
      repositories: page.repositories
          .map((repository) => repository.toDomain())
          .toList(growable: false),
      page: page.page,
      hasNextPage: page.hasNextPage,
      origin: DataOrigin.cache,
      fetchedAt: page.fetchedAt,
      isStale: _cachePolicy.isStale(page.fetchedAt, now),
    );
  }
}
