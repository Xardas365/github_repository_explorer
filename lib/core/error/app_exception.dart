import 'package:github_repository_explorer/core/error/failure.dart';

sealed class AppException implements Exception {
  const AppException();
}

final class NetworkException extends AppException {
  const NetworkException();
}

final class RateLimitException extends AppException {
  const RateLimitException({this.retryAt});

  final DateTime? retryAt;
}

final class ServerException extends AppException {
  const ServerException();
}

final class RequestRejectedException extends AppException {
  const RequestRejectedException();
}

final class CacheException extends AppException {
  const CacheException();
}

final class ParsingException extends AppException {
  const ParsingException();
}

final class ValidationException extends AppException {
  const ValidationException({
    required this.code,
    this.minimumLength,
  });

  final ValidationFailureCode code;
  final int? minimumLength;
}
