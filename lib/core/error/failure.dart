import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({
    @Default('Unable to reach GitHub. Check your connection and try again.')
    String message,
  }) = NetworkFailure;

  const factory Failure.rateLimited({
    @Default('GitHub request limit reached. Please try again later.')
    String message,
    DateTime? retryAt,
  }) = RateLimitedFailure;

  const factory Failure.server({
    @Default('GitHub is unavailable right now. Please try again.')
    String message,
  }) = ServerFailure;

  const factory Failure.cache({
    @Default('Saved data could not be read.') String message,
  }) = CacheFailure;

  const factory Failure.validation({
    required String message,
  }) = ValidationFailure;

  const factory Failure.unexpected({
    @Default('Something unexpected happened. Please try again.') String message,
  }) = UnexpectedFailure;
}
