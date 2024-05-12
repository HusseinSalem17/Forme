import 'package:dio/dio.dart';
import 'package:forme_app/cache/cache_helper.dart';



class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers[ApiKey.token] =
    //     CacheHelper().getData(key: ApiKey.token) != null
    //!         ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
    //         : null;
    super.onRequest(options, handler);
  }
}
