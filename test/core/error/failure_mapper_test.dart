import 'package:github_repository_explorer/core/error/app_exception.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/core/error/failure_mapper.dart';
import 'package:test/test.dart';

void main() {
  test('maps expected exceptions without carrying technical messages', () {
    final retryAt = DateTime.utc(2026, 7, 27);

    expect(
      mapExceptionToFailure(const NetworkException()),
      const Failure.network(),
    );
    expect(
      mapExceptionToFailure(RateLimitException(retryAt: retryAt)),
      Failure.rateLimited(retryAt: retryAt),
    );
    expect(
      mapExceptionToFailure(const ServerException()),
      const Failure.server(),
    );
    expect(
      mapExceptionToFailure(const RequestRejectedException()),
      const Failure.requestRejected(),
    );
    expect(
      mapExceptionToFailure(const CacheException()),
      const Failure.cache(),
    );
    expect(
      mapExceptionToFailure(const ParsingException()),
      const Failure.server(),
    );
    expect(
      mapExceptionToFailure(
        const ValidationException(
          code: ValidationFailureCode.inputTooShort,
          minimumLength: 2,
        ),
      ),
      const Failure.validation(
        code: ValidationFailureCode.inputTooShort,
        minimumLength: 2,
      ),
    );
  });
}
