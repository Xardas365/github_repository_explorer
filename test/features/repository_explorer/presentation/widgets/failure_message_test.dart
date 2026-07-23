import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/core/error/failure.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/failure_message.dart';

void main() {
  testWidgets('adds the local reset time to a rate-limit failure', (
    tester,
  ) async {
    final retryAt = DateTime(2026, 7, 23, 14, 30);
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
            expectedDate = localizations.formatMediumDate(retryAt);
            expectedTime = localizations.formatTimeOfDay(
              TimeOfDay.fromDateTime(retryAt),
              alwaysUse24HourFormat: false,
            );
            return Text(
              formatFailureMessage(
                context,
                Failure.rateLimited(retryAt: retryAt),
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
