// import 'package:dio/dio.dart';
//
// class AuthServices {
//   late Dio dio;
//
//   AuthServices() {
//     BaseOptions options = BaseOptions(
//       connectTimeout: const Duration(seconds: 15),
//       receiveTimeout: const Duration(seconds: 15),
//       receiveDataWhenStatusError: true,
//     );
//     dio = Dio(options);
//   }
//
//   Future<ResponseUserModel> signIn(
//       String username,
//       String password,
//       ) async {
//     try {
//       Response response = await dio.post(
//         '$baseUrl/chat/signin/',
//         data: {
//           'username': username,
//           'password': password,
//         },
//       );
//       print(ResponseUserModel.fromJson(response.data).user.username);
//       print(ResponseUserModel.fromJson(response.data).tokens.access);
//       return ResponseUserModel.fromJson(response.data);
//     } catch (error) {
//       print(error.toString());
//       throw error; // Rethrow error to handle it at the caller's end
//     }
//   }
//
//   Future<ResponseUserModel> signUp(
//       String username,
//       String fName,
//       String lName,
//       String password,
//       ) async {
//     try {
//       Response response = await dio.post(
//         '$baseUrl/chat/signup/',
//         data: {
//           'username': username,
//           'first_name': fName,
//           'last_name': lName,
//           'password': password,
//         },
//       );
//       print(response.data);
//       return ResponseUserModel.fromJson(response.data);
//     } catch (error) {
//       print(error.toString());
//       throw error; // Rethrow error to handle it at the caller's end
//     }
//   }
// }
