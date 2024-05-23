import 'package:dartz/dartz.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/otp_response_success.dart';
import 'package:forme_app/features/authentication/data/models/token_response_success.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/server_errors.dart';
import '../models/verify_otp_response_success.dart';
import '../web_services/auth_services.dart';
import 'auth_repo.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final AuthServices authServices = AuthServices();

  @override
  Future<Either<CustomError, OtpResponseSuccessful>> requestOTP(
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
      return left(CustomError(
        ServerErrorHandler.handleError(e, 'Error occurred while requesting OTP'),
      ));
    }
  }

  @override
  Future<Either<CustomError, VerifyOtpResponseSuccess>> verifyOTP(
      String email,
      String otp,
      ) async {
    try {
      final response = await authServices.verifyOtp(otp: otp, email: email);
      return right(response);
    } catch (e) {
      return left(CustomError(
        ServerErrorHandler.handleError(e, 'Error occurred while verifying OTP'),
      ));
    }
  }

  @override
  Future<Either<CustomError, TokenResponseSuccess>> signUpAccount(
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
      return left(CustomError(
        ServerErrorHandler.handleError(e, 'Error occurred while signing up'),
      ));
    }
  }

  @override
  Future<Either<CustomError, TokenResponseSuccess>> loginAccount(
      String email,
      String password,
      UserType userType,
      ) async {
    try {
      final response = await authServices.loginAccount(
        password: password,
        email: email,
        userType: userType,
      );
      return right(response);
    } catch (e) {
      return left(CustomError(
        ServerErrorHandler.handleError(e, 'Error occurred while logging in'),
      ));
    }
  }
}
