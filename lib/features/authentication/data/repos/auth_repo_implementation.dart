// import 'package:dartz/dartz.dart';
// import '../../../../core/errors/failures.dart';
//
// import '../web_services/auth_services.dart';
// import 'auth_repo.dart';
//
// class AuthRepositoryImplementation extends AuthRepository {
//   final AuthServices authServices;
//
//   AuthRepositoryImplementation(this.authServices);
//
//   @override
//   Future<Either<Failure, ResponseUserModel>> signIn(
//       String username,
//       String password,
//       ) async {
//     try {
//       final response = await authServices.signIn(username, password);
//       return right(response);
//     } catch (error) {
//       print('errrrrrrrrrrrrrrrrrr');
//       return left(
//         ServerFailure(
//           error.toString(),
//         ),
//       );
//     }
//   }
//
//   @override
//   Future<Either<Failure, ResponseUserModel>> signUp(
//       String username,
//       String fName,
//       String lName,
//       String password,
//       ) async {
//     try {
//       final response = await authServices.signUp(
//         username,
//         fName,
//         lName,
//         password,
//       );
//       return right(response);
//     } catch (error) {
//       print('errrrrrrrrrrrrrrrrrr');
//       return left(
//         ServerFailure(
//           error.toString(),
//         ),
//       );
//     }
//   }
// }
