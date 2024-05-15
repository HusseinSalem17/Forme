import 'package:dio/dio.dart';
import 'package:forme_app/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ3MzIxNzEyLCJpYXQiOjE3MTU3ODU3MTIsImp0aSI6IjdhZmRhODEyMTMwZDQ2ZDZhNGI3ZDA2OWQyMDRhZmVhIiwidXNlcl9pZCI6MTh9.Q2U0vRIW2zOjnyQu5eYzINBf_NkCsO7uR59EeJ421UI';

    super.onRequest(options, handler);
  }
}
