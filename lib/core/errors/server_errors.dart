import 'package:dio/dio.dart';

class ServerErrorHandler {
  static String handleError(dynamic error, String defaultMessage) {
    if (error is DioException) {
      return _handleDioError(error, defaultMessage);
    } else {
      return defaultMessage;
    }
  }

  static String _handleDioError(DioException error, String bad) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout with the server";
      case DioExceptionType.sendTimeout:
        return "Send timeout in connection with the server";
      case DioExceptionType.receiveTimeout:
        return "Receive timeout in connection with the server";
      case DioExceptionType.badResponse:
        return _handleErrorResponse(error.response?.statusCode, bad);
      case DioExceptionType.cancel:
        return "Request to the server was cancelled";
      case DioExceptionType.unknown:
        return "Unexpected error occurred";
      default:
        return "Something went wrong";
    }
  }

  static String _handleErrorResponse(int? statusCode, String bad) {
    switch (statusCode) {
      case 400:
        return bad;
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden";
      case 404:
        return "Not found";
      case 500:
        return "Internal server error";
      default:
        return "Received invalid status code: $statusCode";
    }
  }
}
