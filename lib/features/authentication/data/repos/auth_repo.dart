import 'package:dartz/dartz.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/otp_response_success.dart';
import 'package:forme_app/features/authentication/data/models/token_response_success.dart';
import 'package:forme_app/features/authentication/data/models/verify_otp_response_success.dart';
import 'package:forme_app/features/authentication/data/models/set_new_password_success.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AuthRepository {
  Future<Either<CustomError, OtpResponseSuccessfulModel>> requestOTPForSignUp(
    String email,
    UserType userType,
  );

  Future<Either<CustomError, VerifyOtpResponseSuccessModel>> verifyOTPForSignUp(
    String email,
    String otp,
  );

  Future<Either<CustomError, TokenResponseSuccessModel>> signUpAccount(
    String email,
    String password,
    UserType userType,
  );

  Future<Either<CustomError, TokenResponseSuccessModel>> loginAccount(
    String email,
    String password,
    UserType userType,
  );

  Future<Either<CustomError, OtpResponseSuccessfulModel>>
      requestOTPForForgetPassword(
    String email,
  );

  Future<Either<CustomError, VerifyOtpResponseSuccessModel>>
      verifyOTPForgetPassword(
    String email,
    String otp,
  );

  Future<Either<CustomError, SetNewPasswordSuccessModel>> setNewPassword(
    String email,
    String password,
  );

  Future<Either<CustomError, VerifyOtpResponseSuccessModel>> verifyOTP(
    String email,
    String otp,
  );
}
