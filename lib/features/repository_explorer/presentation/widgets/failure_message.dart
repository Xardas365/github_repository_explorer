import 'package:flutter/material.dart';
import 'package:github_repository_explorer/core/error/failure.dart';

DateTime _toLocal(DateTime value) => value.toLocal();

String formatFailureMessage(
  BuildContext context,
  Failure failure, {
  DateTime Function(DateTime) localize = _toLocal,
}) {
  final retryAt = switch (failure) {
    RateLimitedFailure(retryAt: final retryAt?) => localize(retryAt),
    _ => null,
  };
  if (retryAt == null) return failure.message;

  final localizations = MaterialLocalizations.of(context);
  final date = localizations.formatMediumDate(retryAt);
  final time = localizations.formatTimeOfDay(
    TimeOfDay.fromDateTime(retryAt),
    alwaysUse24HourFormat: MediaQuery.alwaysUse24HourFormatOf(context),
  );
  return '${failure.message} Try again after $date at $time.';
}
