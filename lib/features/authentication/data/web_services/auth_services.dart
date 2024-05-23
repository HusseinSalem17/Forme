import 'package:dio/dio.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/requset_otp_model.dart';
import 'package:forme_app/features/authentication/data/models/token_response_model.dart';
import 'package:forme_app/features/authentication/data/models/verify_otp_success.dart';
import 'package:forme_app/features/authentication/data/models/response_otp_success.dart';
import 'package:forme_app/core/secrets/secrets_api_keys.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_errors.dart';

class AuthServices {
  late Dio dio;

  AuthServices() {
    BaseOptions options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<ResponseOtpSuccessful> requestOTP({
    required String email,
    required UserType userType,
  }) async {
    try {
      RequestOtp request = RequestOtp(
        email: email,
        userType: userType,
      );

      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/request_otp/',
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type header
          },
        ),
        data: request.toJson(),
      );

      return ResponseOtpSuccessful.fromJson(response.data);
    } on DioException catch (error) {
      throw CustomError(
          DioErrorHandler.handleDioError(error, 'Not valid email'));
    }
  }

  Future<VerifyOtpSuccess> verifyOtp({
    required String otp,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/verify_otp/',
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type header
          },
        ),
        data: {
          'email': email,
          'otp': otp,
        },
      );
      return VerifyOtpSuccess.fromJson(response.data);
    } on DioException catch (error) {
      print('dio errorrrrrrr');
      throw CustomError(
          DioErrorHandler.handleDioError(error, 'Failed to verify OTP'));
    }
  }

  Future<TokenResponse> signUpAccount({
    required String password,
    required String email,
    required UserType userType,
  }) async {
    try {
      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/register/',
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type header
          },
        ),
        data: {
          'email': email,
          'password': password,
          'user_type': 'trainee',
        },
      );
      return TokenResponse.fromJson(response.data);
    } on DioException catch (error) {
      print('dio error\'s');
      print(error.toString());
      throw CustomError(
        DioErrorHandler.handleDioError(error, 'can not create account'),
      );
    }
  }
}
