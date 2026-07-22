import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/features/repository_explorer/presentation/widgets/search_input.dart';

void main() {
  testWidgets('shows a separate search button on tablet width', (tester) async {
    tester.view.physicalSize = const Size(1200, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final controller = TextEditingController();
    addTearDown(controller.dispose);
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SearchInput(
            controller: controller,
            onChanged: (_) {},
            onSubmitted: (_) {},
            onCleared: controller.clear,
          ),
        ),
      ),
    );

    expect(find.widgetWithText(FilledButton, 'Search'), findsOneWidget);
  });
}
