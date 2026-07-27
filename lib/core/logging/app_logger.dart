import 'dart:developer' as developer;

abstract interface class AppLogger {
  void error(
    String message, {
    required Object error,
    required StackTrace stackTrace,
  });
}

final class DeveloperAppLogger implements AppLogger {
  const DeveloperAppLogger();

  @override
  void error(
    String message, {
    required Object error,
    required StackTrace stackTrace,
  }) {
    developer.log(
      message,
      name: 'github_repository_explorer',
      level: 1000,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
