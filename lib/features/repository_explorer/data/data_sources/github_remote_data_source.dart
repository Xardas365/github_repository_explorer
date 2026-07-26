import 'dart:math';

import 'package:dio/dio.dart';
import 'package:github_repository_explorer/core/cache/cache_policy.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/logging/app_logger.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/dtos/github_search_response_dto.dart';

// GitHub Search API exposes only the first 1,000 results of a search.
const _githubSearchResultLimit = 1000;

bool _nextPageStartsWithinSearchResultLimit({
  required int page,
  required int pageSize,
  required int totalCount,
}) {
  final nextPageStart = page * pageSize + 1;
  final accessibleTotal = min(totalCount, _githubSearchResultLimit);
  return nextPageStart <= accessibleTotal;
}

final class RemoteRepositoryPage {
  const RemoteRepositoryPage({
    required this.repositories,
    required this.hasNextPage,
  });

  final List<GithubRepositoryDto> repositories;
  final bool hasNextPage;
}

abstract interface class GithubRemoteDataSource {
  Future<RemoteRepositoryPage> search({
    required String query,
    required int page,
    required int pageSize,
    required CancelToken cancelToken,
  });
}

final class DioGithubRemoteDataSource implements GithubRemoteDataSource {
  const DioGithubRemoteDataSource(
    this._dio, {
    required Clock clock,
    required AppLogger logger,
  }) : _clock = clock,
       _logger = logger;

  final Dio _dio;
  final Clock _clock;
  final AppLogger _logger;

  @override
  Future<RemoteRepositoryPage> search({
    required String query,
    required int page,
    required int pageSize,
    required CancelToken cancelToken,
  }) async {
    try {
      final response = await _dio.get<Map<String, Object?>>(
        '/search/repositories',
        queryParameters: <String, Object>{
          'q': query,
          'page': page,
          'per_page': pageSize,
        },
        cancelToken: cancelToken,
      );
      final json = response.data;
      if (json == null) {
        throw const ParsingException();
      }
      late final GithubSearchResponseDto dto;
      try {
        dto = GithubSearchResponseDto.fromJson(json);
      } on Object catch (error, stackTrace) {
        _logger.error(
          'GitHub returned an invalid search response.',
          error: error,
          stackTrace: stackTrace,
        );
        throw const ParsingException();
      }
      final hasNextPage =
          !dto.incompleteResults &&
          dto.items.length == pageSize &&
          _nextPageStartsWithinSearchResultLimit(
            page: page,
            pageSize: pageSize,
            totalCount: dto.totalCount,
          );
      return RemoteRepositoryPage(
        repositories: dto.items,
        hasNextPage: hasNextPage,
      );
    } on DioException catch (error, stackTrace) {
      if (CancelToken.isCancel(error)) rethrow;
      _logger.error(
        'GitHub repository search request failed.',
        error: error,
        stackTrace: stackTrace,
      );
      throw _mapDioException(error);
    } on AppException {
      rethrow;
    }
  }

  AppException _mapDioException(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    if (statusCode == 403 || statusCode == 429) {
      final hasRetryAfter = response?.headers.value('retry-after') != null;
      final isPrimaryLimit =
          response?.headers.value('x-ratelimit-remaining')?.trim() == '0';
      final isSecondaryLimit =
          statusCode == 429 || _isSecondaryRateLimit(response?.data);
      if (hasRetryAfter || isPrimaryLimit || isSecondaryLimit) {
        return RateLimitException(
          retryAt:
              _retryAt(response, isPrimaryLimit: isPrimaryLimit) ??
              _clock.now().toUtc().add(const Duration(minutes: 1)),
        );
      }
    }
    if (statusCode != null && statusCode >= 500) {
      return const ServerException();
    }
    if (statusCode == 400 || statusCode == 422) {
      return const ValidationException(
        code: ValidationFailureCode.invalidInput,
      );
    }
    if (statusCode != null && statusCode >= 400 && statusCode < 500) {
      return const RequestRejectedException();
    }
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const NetworkException();
    }
    return const ServerException();
  }

  DateTime? _retryAt(
    Response<Object?>? response, {
    required bool isPrimaryLimit,
  }) {
    final rawRetryAfter = response?.headers.value('retry-after')?.trim();
    final retryAfterSeconds = rawRetryAfter == null
        ? null
        : int.tryParse(rawRetryAfter);
    if (retryAfterSeconds != null && retryAfterSeconds >= 0) {
      return _clock.now().toUtc().add(Duration(seconds: retryAfterSeconds));
    }
    if (!isPrimaryLimit) return null;

    final rawReset = response?.headers.value('x-ratelimit-reset')?.trim();
    final resetSeconds = rawReset == null ? null : int.tryParse(rawReset);
    return resetSeconds == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(resetSeconds * 1000, isUtc: true);
  }

  bool _isSecondaryRateLimit(Object? data) {
    final text = switch (data) {
      Map<Object?, Object?>() =>
        '${data['message'] ?? ''} ${data['documentation_url'] ?? ''}',
      String() => data,
      _ => '',
    }.toLowerCase();
    return text.contains('secondary rate limit') ||
        text.contains('secondary-rate-limits');
  }
}
