import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_listing_app/core/network/app_urls.dart';
import 'package:product_listing_app/core/network/exception.dart';
import 'package:product_listing_app/core/router/app_router.dart';
import 'package:product_listing_app/core/router/app_routes.dart';
import 'package:product_listing_app/core/secure_storage/secure_storage.dart';

abstract class ApiService {
  Future<dynamic> get({required String endpoint,Map<String, dynamic>? queryParameters});
  Future<dynamic> post({required String endpoint, required Map<String, dynamic>? body});
}

class ApiServiceImpl implements ApiService {
  final Dio _dio;
  final SecureStorage _storage;

  ApiServiceImpl(this._storage, {Dio? dio})
      : _dio = dio ?? Dio(
          BaseOptions(
            baseUrl: AppUrls.baseUrl, 
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
            headers: {
              'Content-Type': 'application/json'
              },
          ),
        ){
    // Attach interceptor for token
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.read(key: 'auth_token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
          // Clear all tokens
          await _storage.delete(key: 'auth_token');
          //Navigate user to login screen
          GoRouter.of(AppRouter.navigatorKey.currentContext!).go(RouteName.login);
          debugPrint("User logged out.");
      }
          return handler.next(e);
        },
      ),
    );
  }

  @override
  Future<dynamic> get({required String endpoint, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(endpoint, queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<dynamic> post({required String endpoint, Map<String, dynamic>? body}) async {
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
