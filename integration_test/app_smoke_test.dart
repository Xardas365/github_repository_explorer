import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository_explorer/app/app.dart';
import 'package:github_repository_explorer/app/di/service_locator.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await getIt.reset();
    await configureDependencies();
  });

  tearDown(getIt.reset);

  testWidgets('launches the search experience', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.text('Explore GitHub'), findsOneWidget);
    expect(find.text('Start exploring'), findsOneWidget);
  });
}
