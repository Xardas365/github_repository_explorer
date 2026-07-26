import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';

Failure mapExceptionToFailure(Object error) {
  return switch (error) {
    NetworkException() => const Failure.network(),
    RateLimitException(:final retryAt) => Failure.rateLimited(retryAt: retryAt),
    ServerException() || ParsingException() => const Failure.server(),
    RequestRejectedException() => const Failure.requestRejected(),
    CacheException() => const Failure.cache(),
    ValidationException(:final code, :final minimumLength) =>
      Failure.validation(code: code, minimumLength: minimumLength),
    _ => const Failure.unexpected(),
  };
}
