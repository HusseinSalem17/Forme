import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Can\'t reach the ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('connection Error, Please try again later!');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure(
            'Unexpected Error, Please try again ! ${dioException.response!.data}}');
      default:
        return ServerFailure(
            'Opps There was an Error, Please try again ${dioException.response!.data}');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    // add the case of the user is registered before (the status code of registered user is 409)
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 409 ||
        statusCode == 412 ||
        statusCode == 422) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      //not found
      return ServerFailure(
          'Your request not found, Please try again later! $statusCode');
    } else if (statusCode == 500) {
      //problem in server
      return ServerFailure(
          'Internal Server error, Please try later! $statusCode');
    } else {
      return ServerFailure(
          'Opps There was an Error, Please try again $statusCode');
    }
  }
}
