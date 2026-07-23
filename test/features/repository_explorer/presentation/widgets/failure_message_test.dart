import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/failure_message.dart';

void main() {
  testWidgets('adds the local reset time to a rate-limit failure', (
    tester,
  ) async {
    final retryAt = DateTime.utc(2026, 7, 23, 12, 30);
    final localRetryAt = DateTime(2026, 7, 23, 14, 30);
    DateTime? valuePassedToLocalize;
    late String expectedDate;
    late String expectedTime;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en', 'US'),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child ?? const SizedBox.shrink(),
        ),
        home: Builder(
          builder: (context) {
            final localizations = MaterialLocalizations.of(context);
            expectedDate = localizations.formatMediumDate(localRetryAt);
            expectedTime = localizations.formatTimeOfDay(
              TimeOfDay.fromDateTime(localRetryAt),
            );
            return Text(
              formatFailureMessage(
                context,
                Failure.rateLimited(retryAt: retryAt),
                localize: (value) {
                  valuePassedToLocalize = value;
                  return localRetryAt;
                },
              ),
            );
          },
        ),
      ),
    );

    expect(
      find.text(
        'GitHub request limit reached. Please try again later. '
        'Try again after $expectedDate at $expectedTime.',
      ),
      findsOneWidget,
    );
    expect(valuePassedToLocalize, retryAt);
    expect(valuePassedToLocalize?.isUtc, isTrue);
  });

  testWidgets('keeps the default message when no reset time is known', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) =>
              Text(formatFailureMessage(context, const Failure.rateLimited())),
        ),
      ),
    );

    expect(
      find.text('GitHub request limit reached. Please try again later.'),
      findsOneWidget,
    );
  });
}
