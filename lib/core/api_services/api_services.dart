import 'dart:io';
import 'package:dio/dio.dart';
import 'package:forme_app/core/errors/exceptions.dart';
import 'package:forme_app/core/errors/server_errors.dart';
import 'package:forme_app/local_storage_data/auth_local/tokens.dart';

class ApiServices {
  final Dio _dio = Dio();

  Future<Response> patch(String url, dynamic data) async {
    try {
      String? accessToken = await UserTokenLocal.getAccessToken();
      Response response = await _dio.patch(
        url,
        data: data,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken',
          },
        ),
      );
      return response;
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
          error,
          'Error occurred while uploading your data',
        ),
      );
    }
  }

  Future<Response> get(String url) async {
    try {
      String? accessToken = await UserTokenLocal.getAccessToken();
      Response response = await _dio.get(
        url,
        options: Options(
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer $accessToken',
          },
        ),
      );
      return response;
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
          error,
          'Error occurred while fetching your data',
        ),
      );
    }
  }
}
