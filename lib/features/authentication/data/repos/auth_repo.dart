import 'package:dartz/dartz.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/otp_response_success.dart';
import 'package:forme_app/features/authentication/data/models/token_response_success.dart';
import 'package:forme_app/features/authentication/data/models/verify_otp_response_success.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AuthRepository {
  Future<Either<CustomError, OtpResponseSuccessful>> requestOTP(
    String email,
    UserType userType,
  );

  Future<Either<CustomError, VerifyOtpResponseSuccess>> verifyOTP(
    String email,
    String otp,
  );

  Future<Either<CustomError, TokenResponseSuccess>> signUpAccount(
    String email,
    String password,
    UserType userType,
  );
  Future<Either<CustomError, TokenResponseSuccess>> loginAccount(
      String email,
      String password,
      UserType userType,
      );

}
