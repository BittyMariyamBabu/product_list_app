import 'package:dio/dio.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/core/network/exception.dart';

abstract class ApiService {
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters});
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body});
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;

  ApiServiceImpl({Dio? dio})
      : _dio = dio ?? Dio(
          BaseOptions(
            baseUrl: AppUrls.baseUrl, 
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {'Content-Type': 'application/json'},
          ),
        );

  @override
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await _dio.post(endpoint, data: body);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  dynamic _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.data.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with StatusCode: ${response.statusCode}');
    }
  }
}
