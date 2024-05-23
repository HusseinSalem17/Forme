import 'package:dartz/dartz.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/response_otp_success.dart';
import 'package:forme_app/features/authentication/data/models/token_response_model.dart';
import 'package:forme_app/features/authentication/data/models/verify_otp_success.dart';

import '../../../../core/errors/exceptions.dart';

abstract class AuthRepository {
  Future<Either<CustomError, ResponseOtpSuccessful>> requestOTP(
    String email,
    UserType userType,
  );

  Future<Either<CustomError, VerifyOtpSuccess>> verifyOTP(
    String email,
    String otp,
  );

  Future<Either<CustomError, TokenResponse>> signUpAccount(
    String email,
    String password,
    UserType userType,
  );

}
