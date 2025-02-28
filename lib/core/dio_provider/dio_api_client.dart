import 'dart:io';

import 'package:dio/dio.dart';
import 'package:empowered/core/config/environment_helper.dart';
import 'package:empowered/core/dio_provider/api_error.dart';
import 'package:empowered/core/dio_provider/api_response.dart';
import 'package:empowered/core/preferences/preferences.dart';
import 'package:empowered/extensions/string_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioApiClient {
  DioApiClient(
    this._dio,
    this._environmentHelper,
    this._preference,
    this._externalDio,
  ) {
    _dio.interceptors.add(AppInterceptor());
    _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    _externalDio.interceptors.add(AppInterceptor());
    _externalDio.interceptors.add(PrettyDioLogger(requestBody: true));
    _dio.options.baseUrl =
        _environmentHelper.getValue(EnvironmentKey.baseUrl) ?? '';

    _dio.options.headers = {
      'Accept': 'application/json',
      'responseType': ResponseType.json,
    };

    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }
  final Dio _dio;
  final Dio _externalDio;
  final EnvironmentHelper _environmentHelper;
  final Preferences _preference;

  Future<T> httpGet<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<dynamic>? response;
      final token = await _preference.getString(Preference.accessToken);
      if (!token.isNullOrEmpty()) {
        _dio.options.headers = {
          'Accept': 'application/json',
          'responseType': ResponseType.json,
          'Authorization': 'Bearer $token',
        };
      }

      response = await _dio.get(
        url,
        queryParameters: queryParameters,
      );

      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> externalHttpGet<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Response<dynamic>? response;

      _dio.options.headers = {
        'Accept': 'application/json',
        'responseType': ResponseType.json,
      };

      response = await _externalDio.get(
        url,
        queryParameters: queryParameters,
      );

      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParameters,
        data: body,
      );
      return response.data as T;
    } catch (e) {
      _handleRequestError(e);
      rethrow;
    }
  }

  Future<T> patch<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    Response<dynamic>? response;

    response =
        await _dio.patch(url, queryParameters: queryParameters, data: body);

    return response.data as T;
  }

  Future<T> delete<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    Response<dynamic>? response;

    response = await _dio.delete(
      url,
      data: body,
      queryParameters: queryParameters,
    );

    return response.data as T;
  }

  void _handleRequestError(dynamic error) {
    debugPrint(error.toString());

    if (error is SocketException) {
      final errorCode = error.osError!.errorCode;
      if (errorCode == 61 ||
          errorCode == 60 ||
          errorCode == 111 ||
          errorCode == 101 ||
          errorCode == 104 ||
          errorCode == 51 ||
          errorCode == 8 ||
          errorCode == 113 ||
          errorCode == 7 ||
          errorCode == 64) {
        throw ApiConnectionRefusedError(error);
      }
    }
    if (error is DioException) {
      try {
        final errors = error.response?.data['error'] as Map<String, dynamic>;
        final firstError = errors.values.firstOrNull[0];

        throw ApiErrorResponse(message: firstError);
      } catch (e) {
        if (e is ApiErrorResponse) {
          rethrow;
        } else {
          try {
            final errorMsg = error.response?.data['message'] as String;
            throw ApiErrorResponse(message: errorMsg);
          } catch (e) {
            rethrow;
          }
        }
      }
    }
    throw error;
  }
}

class AppInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    debugPrint(response.data.toString());
    _checkResponseIsOk(response);
    handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    handler.next(err);
  }

  void _checkResponseIsOk(Response<dynamic> response) {
    if (response.statusCode! >= 200 && response.statusCode! < 300) return;
    throw ApiError(response);
  }
}
