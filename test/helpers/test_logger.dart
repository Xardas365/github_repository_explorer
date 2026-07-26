import 'package:github_repository_explorer/core/logging/app_logger.dart';

final class RecordedError {
  const RecordedError({
    required this.message,
    required this.error,
    required this.stackTrace,
  });

  final String message;
  final Object error;
  final StackTrace stackTrace;
}

final class RecordingAppLogger implements AppLogger {
  final errors = <RecordedError>[];

  @override
  void error(
    String message, {
    required Object error,
    required StackTrace stackTrace,
  }) {
    errors.add(
      RecordedError(
        message: message,
        error: error,
        stackTrace: stackTrace,
      ),
    );
  }
}
