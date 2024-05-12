import 'package:dartz/dartz.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/response_otp_successful.dart';

import '../../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseOtpSuccessful>> requestOTP(
    String email,
    UserType userType,
  );
// Future<Either<Failure, ResponseUserModel>> signIn(
//     String username,
//     String password,
//     );
//
// Future<Either<Failure, ResponseUserModel>> signUp(
//     String username,
//     String fName,
//     String lName,
//     String password,
//     );
}
