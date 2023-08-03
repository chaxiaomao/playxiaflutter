import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:wanxia/common/dio/auth_interceptor.dart';
import 'package:wanxia/common/dio/http_cache.dart';
import 'package:wanxia/common/env.dart';
import 'package:wanxia/common/values/config.dart';

/*
  * http 操作类
  *
  * 手册
  * https://github.com/flutterchina/dio/blob/master/README-ZH.md#formdata
  *
  * 从2.1.x升级到 3.x
  * https://github.com/flutterchina/dio/blob/master/migration_to_3.0.md
*/
class Http {
  static final Http _instance = Http._internal();

  factory Http() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  Http._internal() {

    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: env!.baseUrl,

      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: CONNECT_TIMEOUT,

      // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: RECEIVE_TIMEOUT,

      // Http请求头.
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',

      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    // 添加拦截器
    dio.interceptors.add(AuthInterceptor());

    // 加内存缓存
    dio.interceptors.add(HttpCache());

    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    //   if (!Global.isRelease && PROXY_ENABLE) {
    //     (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //         (client) {
    //       client.findProxy = (uri) {
    //         return "PROXY $PROXY_IP:$PROXY_PORT";
    //       };
    //       //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
    //       client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //     };
    //   }
    // }

    /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
    void cancelRequests(CancelToken token) {
      token.cancel("cancelled");
    }

    /// restful get 操作
    /// refresh 是否下拉刷新 默认 false
    /// noCache 是否不缓存 默认 false
    /// list 是否列表 默认 false
    /// cacheKey 缓存key
    /// cacheDisk 是否磁盘缓存
    /// https://github.com/llfbandit/dio_cache_interceptor
    Future get(
      String path, {
      dynamic params,
      Options? options,
      bool refresh = false,
      bool noCache = false,
      bool list = false,
      String? cacheKey,
      bool cacheDisk = false,
    }) async {
      Options requestOptions = options ?? Options();
      requestOptions = requestOptions.copyWith(extra: {
        "refresh": refresh,
        "noCache": noCache,
        "list": list,
        "cacheKey": cacheKey,
        "cacheDisk": cacheDisk,
      });

      var response = await dio.get(path, queryParameters: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    }

    /// restful post 操作
    Future post(
      String path, {
      dynamic params,
      Options? options,
    }) async {
      Options requestOptions = options ?? Options();
      var response = await dio.post(path, data: params, options: requestOptions, cancelToken: cancelToken);
      return response.data;
    }
  }
}
