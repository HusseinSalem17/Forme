import 'package:dio/dio.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/requset_otp_model.dart';

import '../../../../core/secrets/secrets_api_keys.dart';
import '../models/response_otp_successful.dart';

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

  // Future<ResponseUserModel> signIn(
  //     String username,
  //     String password,
  //     ) async {
  //   try {
  //     Response response = await dio.post(
  //       '$baseUrl/chat/signin/',
  //       data: {
  //         'username': username,
  //         'password': password,
  //       },
  //     );
  //     print(ResponseUserModel.fromJson(response.data).user.username);
  //     print(ResponseUserModel.fromJson(response.data).tokens.access);
  //     return ResponseUserModel.fromJson(response.data);
  //   } catch (error) {
  //     print(error.toString());
  //     throw error; // Rethrow error to handle it at the caller's end
  //   }
  // }

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
    } catch (error) {
      print(error.toString());
      rethrow;
    }
  }
}
