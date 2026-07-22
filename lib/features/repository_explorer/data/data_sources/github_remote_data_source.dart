import 'package:dio/dio.dart';
import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/features/repository_explorer/data/dtos/github_search_response_dto.dart';

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
  });
}

final class DioGithubRemoteDataSource implements GithubRemoteDataSource {
  const DioGithubRemoteDataSource(this._dio);

  final Dio _dio;

  @override
  Future<RemoteRepositoryPage> search({
    required String query,
    required int page,
    required int pageSize,
  }) async {
    try {
      final response = await _dio.get<Map<String, Object?>>(
        '/search/repositories',
        queryParameters: <String, Object>{
          'q': query,
          'page': page,
          'per_page': pageSize,
        },
      );
      final json = response.data;
      if (json == null) {
        throw const ParsingException('GitHub returned an empty response.');
      }
      final dto = GithubSearchResponseDto.fromJson(json);
      final hasNextPage =
          !dto.incompleteResults &&
          dto.items.length == pageSize &&
          page * pageSize < dto.totalCount;
      return RemoteRepositoryPage(
        repositories: dto.items,
        hasNextPage: hasNextPage,
      );
    } on DioException catch (error) {
      throw _mapDioException(error);
    } on AppException {
      rethrow;
    } on Object catch (error) {
      throw ParsingException('GitHub returned invalid data: $error');
    }
  }

  AppException _mapDioException(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 403 || statusCode == 429) {
      final rawReset = error.response?.headers.value('x-ratelimit-reset');
      final resetSeconds = rawReset == null ? null : int.tryParse(rawReset);
      return RateLimitException(
        retryAt: resetSeconds == null
            ? null
            : DateTime.fromMillisecondsSinceEpoch(
                resetSeconds * 1000,
                isUtc: true,
              ),
      );
    }
    if (statusCode != null && statusCode >= 500) {
      return const ServerException();
    }
    if (error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout) {
      return const NetworkException();
    }
    return ServerException(error.message ?? 'GitHub request failed.');
  }
}
