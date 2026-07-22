import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/app_state_panel.dart';

void main() {
  testWidgets('shows the error and invokes retry', (tester) async {
    var retried = false;
    await tester.pumpWidget(
      MaterialApp(
        home: AppStatePanel(
          icon: Icons.cloud_off,
          title: 'Search failed',
          message: 'Unable to reach GitHub.',
          actionLabel: 'Try again',
          onAction: () => retried = true,
        ),
      ),
    );

    expect(find.text('Search failed'), findsOneWidget);
    expect(find.text('Unable to reach GitHub.'), findsOneWidget);
    await tester.tap(find.text('Try again'));
    expect(retried, isTrue);
  });
}
