import 'package:dio/dio.dart';
import 'package:forme_app/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQ3MzQ2MTU5LCJpYXQiOjE3MTU4MTAxNTksImp0aSI6IjdmMDRmN2M2ZmMwMjQ4ZWQ4YWZkNjg0ZjY2NzlkZmRjIiwidXNlcl9pZCI6MTh9.GMKAZ4GO2JeABNGH22-D4Db6zsMtx6UfpCouhGOAVRI';
    super.onRequest(options, handler);
  }
}
