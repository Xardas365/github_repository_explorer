import 'package:flutter/material.dart';
import 'package:github_repository_explorer/core/error/failure.dart';

DateTime _toLocal(DateTime value) => value.toLocal();

String formatFailureMessage(
  BuildContext context,
  Failure failure, {
  DateTime Function(DateTime) localize = _toLocal,
}) {
  final message = switch (failure) {
    NetworkFailure() =>
      'Unable to reach GitHub. Check your connection and try again.',
    RateLimitedFailure() =>
      'GitHub request limit reached. Please try again later.',
    ServerFailure() => 'GitHub is unavailable right now. Please try again.',
    RequestRejectedFailure() =>
      'GitHub rejected the request. Check the search and try again.',
    CacheFailure() => 'Saved data could not be read.',
    ValidationFailure(
      code: ValidationFailureCode.inputTooShort,
      :final minimumLength,
    ) =>
      'Enter at least ${minimumLength ?? 2} characters to search.',
    ValidationFailure(code: ValidationFailureCode.invalidInput) =>
      'The search query is not valid. Adjust it and try again.',
    UnexpectedFailure() => 'Something unexpected happened. Please try again.',
  };
  final retryAt = switch (failure) {
    RateLimitedFailure(retryAt: final retryAt?) => localize(retryAt),
    _ => null,
  };
  if (retryAt == null) return message;

  final localizations = MaterialLocalizations.of(context);
  final date = localizations.formatMediumDate(retryAt);
  final time = localizations.formatTimeOfDay(
    TimeOfDay.fromDateTime(retryAt),
    alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
  );
  return '$message Try again after $date at $time.';
}
