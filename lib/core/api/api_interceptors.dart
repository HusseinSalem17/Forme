import 'package:dio/dio.dart';
//import 'package:forme_app/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzUwOTA4OTU0LCJpYXQiOjE3MTkzNzI5NTQsImp0aSI6ImY4ZWE5NzhiMmUwYTQ3YWU4ZThmOWE5ZTAxMzQzMWE1IiwidXNlcl9pZCI6NX0.sfcIzSNY0F2BuINVMLgcKmaLnM3Ug1VuyGJN6U9KizU';
    super.onRequest(options, handler);
  }
}
