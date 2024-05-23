import 'package:dio/dio.dart';
//import 'package:forme_app/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ3OTMzMjQ2LCJpYXQiOjE3MTYzOTcyNDYsImp0aSI6IjM2ZGU2NTVjOGQ4ZTQ0MDk4NjViNjY5NDkxZTAzNDYwIiwidXNlcl9pZCI6NH0.2efHkCa5MZ6rkNdwDttp-53O-tJnY8DHjYW_Q17xcxc';
    super.onRequest(options, handler);
  }
}
