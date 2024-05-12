import 'package:dartz/dartz.dart';
import 'package:forme_app/core/user_type.dart';
import 'package:forme_app/features/authentication/data/models/response_otp_successful.dart';
import '../../../../core/errors/failures.dart';

import '../web_services/auth_services.dart';
import 'auth_repo.dart';

class AuthRepositoryImplementation extends AuthRepository {
  final AuthServices authServices = AuthServices();

  // @override
  // Future<Either<Failure, ResponseUserModel>> signIn(
  //     String username,
  //     String password,
  //     ) async {
  //   try {
  //     final response = await authServices.signIn(username, password);
  //     return right(response);
  //   } catch (error) {
  //     print('errrrrrrrrrrrrrrrrrr');
  //     return left(
  //       ServerFailure(
  //         error.toString(),
  //       ),
  //     );
  //   }
  // }
  //
  // @override
  // Future<Either<Failure, ResponseUserModel>> signUp(
  //     String username,
  //     String fName,
  //     String lName,
  //     String password,
  //     ) async {
  //   try {
  //     final response = await authServices.signUp(
  //       username,
  //       fName,
  //       lName,
  //       password,
  //     );
  //     return right(response);
  //   } catch (error) {
  //     print('errrrrrrrrrrrrrrrrrr');
  //     return left(
  //       ServerFailure(
  //         error.toString(),
  //       ),
  //     );
  //   }
  // }

  @override
  Future<Either<Failure, ResponseOtpSuccessful>> requestOTP(
    String email,
    UserType userType,
  ) async {
    try {
      final response = await authServices.requestOTP(
        email: email,
        userType: userType,
      );
      return right(response);
    } on Exception catch (e) {
      print('can not send otp');
      return left(ServerFailure(e.toString()));
    }
  }
}
