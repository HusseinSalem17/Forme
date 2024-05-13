// import 'package:dio/dio.dart';
// import 'package:forme_app/core/utils/api_end_points.dart';

// class ApiService {
  
//   final Dio _dio;

//   ApiService(this._dio);

//   Future<Map<String, dynamic>> get({required String endPoint}) async {
//     var response = await _dio.get(EndPoint.baseUrl + endPoint);
//     //data returns as Map
//     return response.data;
//   }

//   Future<dynamic> post({
//     required String endPoint,
//     required dynamic data,
//     Map<String, dynamic>? headers,
//   }) async {
//     var response = await _dio.post(
//       EndPoint.baseUrl + endPoint,
//       data: data,
//       options: Options(headers: headers),
//     );
//     return response.data;
//   }

//   Future<Map<String, dynamic>> put(
//       {required String endPoint, required dynamic data}) async {
//     var response = await _dio.put(EndPoint.baseUrl + endPoint, data: data);
//     return response.data;
//   }

//   Future<Map<String, dynamic>> update(
//       {required String endPoint, required dynamic data}) async {
//     var response = await _dio.patch(EndPoint.baseUrl + endPoint, data: data);
//     return response.data;
//   }
// }
