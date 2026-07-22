import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/error/failure_mapper.dart';
import 'package:github_repository_explorer/core/result/result.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/github_remote_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/data_sources/repository_local_data_source.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/database/cached_repository_model.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/mappers/repository_mapper.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_page.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/entities/repository_search_request.dart';
import 'package:github_repository_explorer/features/repository_explorer/domain/repositories/repository_search_repository.dart';

final class RepositorySearchRepositoryImpl
    implements RepositorySearchRepository {
  const RepositorySearchRepositoryImpl({
    required GithubRemoteDataSource remote,
    required RepositoryLocalDataSource local,
    required CachePolicy cachePolicy,
    required Clock clock,
  }) : _remote = remote,
       _local = local,
       _cachePolicy = cachePolicy,
       _clock = clock;

  final GithubRemoteDataSource _remote;
  final RepositoryLocalDataSource _local;
  final CachePolicy _cachePolicy;
  final Clock _clock;

  @override
  Stream<Result<RepositoryPage>> search(
    RepositorySearchRequest request,
  ) async* {
    CachedRepositoryPage? cached;
    try {
      cached = await _local.readPage(query: request.query, page: request.page);
      if (cached != null && !request.forceRefresh) {
        yield Result.success(_cachedPageToDomain(cached));
      }
    } on Object {
      cached = null;
    }

    try {
      final response = await _remote.search(
        query: request.query,
        page: request.page,
        pageSize: request.pageSize,
      );
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
        await _local.prune(
          olderThan: now.subtract(_cachePolicy.retainFor),
        );
      } on Object {
        // A cache write must not hide a valid network response.
      }
      yield Result.success(
        RepositoryPage(
          repositories: repositories,
          page: request.page,
          hasNextPage: response.hasNextPage,
          origin: DataOrigin.network,
          fetchedAt: now,
        ),
      );
    } on Object catch (error) {
      final failure = mapExceptionToFailure(error);
      if (cached != null) {
        yield Result.success(
          _cachedPageToDomain(cached).copyWith(refreshFailure: failure),
        );
      } else {
        yield Result.failure(failure);
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
