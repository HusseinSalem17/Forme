import 'package:dio/dio.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/request_register.dart';
import 'package:forme_app/features/authentication/data/models/requset_otp.dart';
import 'package:forme_app/features/authentication/data/models/set_new_password_success.dart';
import 'package:forme_app/features/authentication/data/models/token_response_success.dart';
import 'package:forme_app/features/authentication/data/models/verify_otp_response_success.dart';
import 'package:forme_app/features/authentication/data/models/otp_response_success.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_errors.dart';
import '../../../../core/secrets_api_keys/secrets_api_keys.dart';

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

  Future<OtpResponseSuccessfulModel> requestOTPForSignUp({
    required String email,
    required UserType userType,
  }) async {
    try {
      RequestOtp request = RequestOtp(
        email: email,
        userType: userType,
      );

      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/request-otp/',
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type header
          },
        ),
        data: request.toJson(),
      );

      return OtpResponseSuccessfulModel.fromJson(response.data);
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while requesting OTP'),
      );
    }
  }

  Future<VerifyOtpResponseSuccessModel> verifyOtp({
    required String otp,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/verify-otp/',
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
      return VerifyOtpResponseSuccessModel.fromJson(response.data);
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while verifying OTP'),
      );
    }
  }

  Future<TokenResponseSuccessModel> signUpAccount({
    required String password,
    required String email,
    required UserType userType,
  }) async {
    try {
      return await _authenticate(
        endpoint: 'register',
        password: password,
        email: email,
        userType: userType,
        errorMessage: 'Cannot create account',
      );
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while signing up'),
      );
    }
  }

  Future<TokenResponseSuccessModel> loginAccount({
    required String password,
    required String email,
    required UserType userType,
  }) async {
    try {
      return await _authenticate(
        endpoint: 'login',
        password: password,
        email: email,
        userType: userType,
        errorMessage: 'Make sure the password and email are correct',
      );
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while logging in'),
      );
    }
  }

  Future<TokenResponseSuccessModel> _authenticate({
    required String endpoint,
    required String password,
    required String email,
    required UserType userType,
    required String errorMessage,
  }) async {
    try {
      RequestRegister requestRegister = RequestRegister(
        email: email,
        password: password,
        userType: userType,
      );

      print('Authenticating with endpoint: $endpoint');
      print('Request Data: ${requestRegister.toJson()}');

      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/$endpoint/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: requestRegister.toJson(),
      );

      print('Response Data: ${response.data}');
      return TokenResponseSuccessModel.fromJson(response.data);
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(error, errorMessage),
      );
    }
  }

  Future<OtpResponseSuccessfulModel> requestOTPForForgetPassword({
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/forget-password/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'email': email,
        },
      );

      return OtpResponseSuccessfulModel.fromJson(response.data);
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while requesting OTP'),
      );
    }
  }

  Future<VerifyOtpResponseSuccessModel> verifyOtpForgetPassword({
    required String otp,
    required String email,
  }) async {
    try {
      Response response = await dio.post(
        '${SecretsApiKeys.baseUrl}/auth/verify-otp/',
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
      return VerifyOtpResponseSuccessModel.fromJson(response.data);
    } catch (error) {
      throw CustomError(
        ServerErrorHandler.handleError(
            error, 'Error occurred while verifying OTP'),
      );
    }
  }

  Future<SetNewPasswordSuccessModel> setNewPassword(
      String password, String email) async {
    try {
      print(password);
      print(email);
      Response response = await dio.put(
        '${SecretsApiKeys.baseUrl}/auth/set-new-password/',
        options: Options(
          headers: {
            'Content-Type': 'application/json', // Set the content type header
          },
        ),
        data: {
          'email': email,
          'new_password': password,
        },
      );
      return SetNewPasswordSuccessModel.fromJson(response.data);
    } catch (error) {
      print('i have error in the web services');
      print(error);
      throw CustomError(
        ServerErrorHandler.handleError(error, 'Cant set a new Password'),
      );
    }
  }
}
