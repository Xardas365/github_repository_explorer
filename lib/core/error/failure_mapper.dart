import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';

Failure mapExceptionToFailure(Object error) {
  return switch (error) {
    NetworkException(:final message) => Failure.network(message: message),
    RateLimitException(:final retryAt) => Failure.rateLimited(retryAt: retryAt),
    ServerException(:final message) => Failure.server(message: message),
    CacheException(:final message) => Failure.cache(message: message),
    ParsingException(:final message) => Failure.server(message: message),
    _ => const Failure.unexpected(),
  };
}
