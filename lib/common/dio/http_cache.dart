//
// import 'package:dio/dio.dart';
// import 'package:wanxia/common/local/storage.dart';
// import 'package:wanxia/common/values/config.dart';
//
// class CacheObject {
//   CacheObject(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;
//   Response response;
//   int timeStamp;
//
//   @override
//   bool operator ==(other) {
//     return response.hashCode == other.hashCode;
//   }
//
//   @override
//   int get hashCode => response.realUri.hashCode;
// }
//
// class HttpCache extends Interceptor {
//   // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
//   var cache = <String, CacheObject>{};
//
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     // if (!CACHE_ENABLE) {
//     //   return;
//     // }
//
//     // refresh标记是否是"下拉刷新"
//     bool refresh = options.extra["refresh"] == false;
//
//     // 是否磁盘缓存
//     bool cacheDisk = options.extra["cacheDisk"] == false;
//
//     // 如果是下拉刷新，先删除相关缓存
//     if (refresh) {
//       if (options.extra["list"] == true) {
//         //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
//         cache.removeWhere((key, v) => key.contains(options.path));
//       } else {
//         // 如果不是列表，则只删除uri相同的缓存
//         delete(options.uri.toString());
//       }
//
//       // 删除磁盘缓存
//       if (cacheDisk) {
//         await LocalStorage().remove(options.uri.toString());
//       }
//     }
//
//     // get 请求，开启缓存
//     if (!options.extra["noCache"] && options.method.toLowerCase() == 'get') {
//       String key = options.extra["cacheKey"] ?? options.uri.toString();
//       var response;
//       // 策略 1 内存缓存优先，2 然后才是磁盘缓存
//       // 1 内存缓存
//       var ob = cache[key];
//       if (ob != null) {
//         //若缓存未过期，则返回缓存内容
//         if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 < CACHE_MAXAGE) {
//           response = cache[key]?.response;
//           if (response != null) {
//             handler.resolve(response, true);
//           }
//         } else {
//           //若已过期则删除缓存，继续向服务器请求
//           cache.remove(key);
//         }
//       }
//       // 2 磁盘缓存
//       if (cacheDisk) {
//         var cacheData = LocalStorage().getJSON(key);
//         if (cacheData != null) {
//           response = cacheData;
//           // response = Response(
//           //   statusCode: 200,
//           //   data: cacheData,
//           //   requestOptions: options,
//           // );
//           handler.resolve(response, true);
//         }
//       }
//       // super.onRequest(options, handler);
//     }
//
//     return;
//   }
//
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     super.onError(err, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler,) async {
//     super.onResponse(response, handler);
//     RequestOptions options = response.requestOptions;
//     if (!options.extra["noCache"] && options.method.toLowerCase() == 'get') {
//       // 只缓存 get 的请求
//       if (options.extra["noCache"] != true && options.method.toLowerCase() == "get") {
//         // 策略：内存、磁盘都写缓存
//
//         // 缓存key
//         String key = options.extra["cacheKey"] ?? options.uri.toString();
//
//         // 磁盘缓存
//         if (options.extra["cacheDisk"] == true) {
//           // await LocalStorage().setJSON(key, response.data);
//           await LocalStorage().setJSON(key, response);
//         }
//
//         // 内存缓存
//         // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
//         if (cache.length == CACHE_MAXCOUNT) {
//           cache.remove(cache[cache.keys.first]);
//         }
//
//         cache[key] = CacheObject(response);
//       }
//     }
//   }
//
//   void delete(String key) {
//     cache.remove(key);
//   }
// }
//
//
// /// restful get 操作
// /// refresh 是否下拉刷新 默认 false
// /// noCache 是否不缓存 默认 false
// /// list 是否列表 默认 false
// /// cacheKey 缓存key
// /// cacheDisk 是否磁盘缓存
// /// https://github.com/llfbandit/dio_cache_interceptor
// // Future get(
// //     String path, {
// //       dynamic params,
// //       Options? options,
// //       bool refresh = false,
// //       bool noCache = false,
// //       String? cacheKey,
// //       bool cacheDisk = false,
// //     }) async {
// //   Options requestOptions = options ?? Options();
// //   requestOptions = requestOptions.copyWith(extra: {
// //     "refresh": refresh,
// //     "noCache": noCache,
// //     "cacheKey": cacheKey,
// //     "cacheDisk": cacheDisk,
// //   });
// //
// //   var response = await dio.get(path, queryParameters: params, options: requestOptions, cancelToken: cancelToken);
// //   return response.data;
// // }
// //
// // /// restful post 操作
// // Future post(
// //     String path, {
// //       dynamic params,
// //       Options? options,
// //     }) async {
// //   Options requestOptions = options ?? Options();
// //   var response = await dio.post(path, data: params, options: requestOptions, cancelToken: cancelToken);
// //   return response.data;
// // }
