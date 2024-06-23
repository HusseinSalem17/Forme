import 'package:dio/dio.dart';
//import 'package:forme_app/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ5NDIyMjg2LCJpYXQiOjE3MTc4ODYyODYsImp0aSI6ImU0NGY4NTA1ZWUyOTRlNjBhZDE2ZmM3ZDBjNWZjMTVkIiwidXNlcl9pZCI6M30.hPQ6bmN7YRZUo25kq3vcVr-wm5Jmms2tJoYGoIjDSkg';
    super.onRequest(options, handler);
  }
}
