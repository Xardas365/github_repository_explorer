import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

enum ValidationFailureCode { inputTooShort, invalidInput }

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network() = NetworkFailure;

  const factory Failure.rateLimited({
    DateTime? retryAt,
  }) = RateLimitedFailure;

  const factory Failure.server() = ServerFailure;

  const factory Failure.requestRejected() = RequestRejectedFailure;

  const factory Failure.cache() = CacheFailure;

  const factory Failure.validation({
    required ValidationFailureCode code,
    int? minimumLength,
  }) = ValidationFailure;

  const factory Failure.unexpected() = UnexpectedFailure;
}
