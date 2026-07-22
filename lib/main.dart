import 'package:flutter/material.dart';
import 'package:github_repository_explorer/app/app.dart';
import 'package:github_repository_explorer/app/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
