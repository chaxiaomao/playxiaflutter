import 'package:dio/dio.dart';

class AuthInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 在请求之前，可以在此处添加公共的请求头等操作
    print("Request Interceptor - Adding common headers");
    options.headers['Authorization'] = 'Bearer YourAuthToken';
    // return super.onRequest(options, handler);

  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 在收到响应之后，可以在此处处理响应数据或错误信息
    ///处理权限 提示
    print("Response Interceptor - Handling response");
    print("Response data: ${response.data}");
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // 在请求发生错误时，可以在此处处理错误信息
    print("Error Interceptor - Handling error");
    print("Error message: ${err.message}");
    return super.onError(err, handler);
  }
}