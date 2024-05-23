import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/response_otp_success.dart';
import 'package:forme_app/features/authentication/data/models/token_response_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_errors.dart';
import '../models/verify_otp_success.dart';
import '../web_services/auth_services.dart';
import 'auth_repo.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final AuthServices authServices = AuthServices();

  @override
  Future<Either<CustomError, ResponseOtpSuccessful>> requestOTP(
    String email,
    UserType userType,
  ) async {
    try {
      final response = await authServices.requestOTP(
        email: email,
        userType: userType,
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        final errorMessage = DioErrorHandler.handleDioError(e, '');
        return left(CustomError(errorMessage));
      }
      return left(CustomError(e.toString()));
    }
  }

  @override
  Future<Either<CustomError, VerifyOtpSuccess>> verifyOTP(
    String email,
    String otp,
  ) async {
    try {
      final response = await authServices.verifyOtp(otp: otp, email: email);
      return right(response);
    } catch (e) {
      if (e is DioException) {
        final errorMessage =
            DioErrorHandler.handleDioError(e, 'Failed to verify OTP');
        return left(CustomError(errorMessage));
      }
      return left(CustomError(e.toString()));
    }
  }

  @override
  Future<Either<CustomError, TokenResponse>> signUpAccount(
    String email,
    String password,
    UserType userType,
  ) async {
    try {
      final response = await authServices.signUpAccount(
        password: password,
        email: email,
        userType: userType,
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        final errorMessage =
            DioErrorHandler.handleDioError(e, 'Can\'t create account');
        return left(CustomError(errorMessage));
      }
      return left(CustomError(e.toString()));
    }
  }
}
