import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/cache_status_banner.dart';

void main() {
  testWidgets('describes a fresh cache without claiming to refresh', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CacheStatusBanner(
            isStale: false,
            fetchedAt: DateTime(2026, 7, 23, 6, 15),
          ),
        ),
      ),
    );

    expect(
      find.text('Showing saved results from 23.07.2026 06:15.'),
      findsOneWidget,
    );
    expect(find.textContaining('checking for updates'), findsNothing);
  });
}
