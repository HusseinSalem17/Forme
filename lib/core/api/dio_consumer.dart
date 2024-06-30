import 'package:dio/dio.dart';
import 'package:forme_app/core/api/api_consumer.dart';
import 'package:forme_app/core/api/api_interceptors.dart';
import 'package:forme_app/core/errors/failures.dart';

import '../secrets_api_keys/secrets_api_keys.dart';

class DioFile extends ApiConsumer {
  final Dio dio;

  DioFile({required this.dio}) {
    dio.options.baseUrl = SecretsApiKeys.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<dynamic> _request(
    Future<Response> Function() requestFunction,
  ) async {
    try {
      final response = await requestFunction();
      return response.data;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) {
    return _request(() => dio.delete(
          path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
        ));
  }

  @override
  Future<dynamic> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) {
    return _request(() => dio.get(
          path,
          data: data,
          queryParameters: queryParameters,
        ));
  }

  @override
  Future<dynamic> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) {
    return _request(() => dio.patch(
          path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
        ));
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) {
    return _request(() => dio.post(
          path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
        ));
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) {
    return _request(() => dio.put(
          path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters,
        ));
  }
}
