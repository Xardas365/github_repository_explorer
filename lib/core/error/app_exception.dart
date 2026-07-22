sealed class AppException implements Exception {
  const AppException(this.message, {this.retryAt});

  final String message;
  final DateTime? retryAt;
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'Network request failed.']);
}

final class RateLimitException extends AppException {
  const RateLimitException({super.retryAt})
    : super('GitHub request limit reached.');
}

final class ServerException extends AppException {
  const ServerException([super.message = 'Remote server request failed.']);
}

final class CacheException extends AppException {
  const CacheException([super.message = 'Local cache operation failed.']);
}

final class ParsingException extends AppException {
  const ParsingException([super.message = 'Response data was invalid.']);
}
