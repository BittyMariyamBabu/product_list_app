import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return FetchDataException("Connection Timeout");
      case DioExceptionType.sendTimeout:
        return FetchDataException("Request Timeout");
      case DioExceptionType.receiveTimeout:
        return FetchDataException("Receive Timeout");
      case DioExceptionType.badResponse:
        return FetchDataException(
            "Received invalid status code: ${error.response?.statusCode}");
      case DioExceptionType.cancel:
        return FetchDataException("Request Cancelled");
      case DioExceptionType.unknown:
      default:
        return FetchDataException(error.message!);
    }
  }
}

class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.message);
}

class FetchDataException extends ApiException {
  FetchDataException(super.message);
}

