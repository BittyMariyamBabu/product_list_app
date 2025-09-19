import 'package:dio/dio.dart';

/// Base API Exception
class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;

  /// Factory to convert DioException into your ApiException types
  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return FetchDataException("Connection Timeout");
      case DioExceptionType.sendTimeout:
        return FetchDataException("Request Timeout");
      case DioExceptionType.receiveTimeout:
        return FetchDataException("Receive Timeout");
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 'Unknown';
        return FetchDataException("Invalid status code: $statusCode");
      case DioExceptionType.cancel:
        return FetchDataException("Request Cancelled");
      case DioExceptionType.unknown:
      default:
        // Safe fallback for null or unknown errors
        final msg = error.message ?? "Unknown Error Occurred";
        return FetchDataException(msg);
    }
  }
}

/// Specific exceptions
class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}

class FetchDataException extends ApiException {
  FetchDataException(super.message);
}


