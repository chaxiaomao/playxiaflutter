import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:wanxia/common/widgets/message.dart';
import 'package:wanxia/common/values/values.dart';


class AuthInterceptor extends InterceptorsWrapper {

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 在请求之前，可以在此处添加公共的请求头等操作
    // options.headers['XX-Token'] = 'af48d9b45461238ce4548040f3a0b78916236481d321f6862898ea87d8d36d78';
    // options.headers['XX-Device-Type'] = 'wxapp';
    // return super.onRequest(options, handler);
    handler.next(options);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 在收到响应之后，可以在此处处理响应数据或错误信息
    var jsonResp = json.decode(response.toString());
    if (jsonResp['code'] == CODE_SUCCESS) {
      return super.onResponse(response, handler);
    }
    Message.showToast("${jsonResp['code']}:${jsonResp['msg']}");
    return;
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    // 在请求发生错误时，可以在此处处理错误信息
    print("Error message: ${err.message}");
    Message.showToast("${err.message}");
    return super.onError(err, handler);
  }
}