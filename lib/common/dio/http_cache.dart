import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:wanxia/common/local/storage.dart';
import 'package:wanxia/common/values/config.dart';

class CacheObject {
  CacheObject(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class HttpCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = <String, CacheObject>{};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // if (!CACHE_ENABLE) {
    //   return;
    // }

    // refresh标记是否是"下拉刷新"
    bool refresh = options.extra["refresh"] == false;

    // 是否磁盘缓存
    bool cacheDisk = options.extra["cacheDisk"] == false;

    // 如果是下拉刷新，先删除相关缓存
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, v) => key.contains(options.path));
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }

      // 删除磁盘缓存
      if (cacheDisk) {
        await LocalStorage().remove(options.uri.toString());
      }
    }

    // get 请求，开启缓存
    if (!options.extra["noCache"] && options.method.toLowerCase() == 'get') {
      var response;
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      // 策略 1 内存缓存优先，2 然后才是磁盘缓存
      // 1 内存缓存
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 < CACHE_MAXAGE) {
          response = cache[key]?.response;
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
      // 2 磁盘缓存
      if (cacheDisk) {
        var cacheData = LocalStorage().getJSON(key);
        if (cacheData != null) {
          response = Response(
            statusCode: 200,
            data: cacheData,
            requestOptions: options,
          );
        }
      }
      super.onRequest(options, handler);
    }

    return;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler,) async {
    super.onResponse(response, handler);
    RequestOptions options = response.requestOptions;
    if (!options.extra["noCache"] && options.method.toLowerCase() == 'get') {
      // 只缓存 get 的请求
      if (options.extra["noCache"] != true && options.method.toLowerCase() == "get") {
        // 策略：内存、磁盘都写缓存

        // 缓存key
        String key = options.extra["cacheKey"] ?? options.uri.toString();

        // 磁盘缓存
        if (options.extra["cacheDisk"] == true) {
          await LocalStorage().setJSON(key, response.data);
        }

        // 内存缓存
        // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
        if (cache.length == CACHE_MAXCOUNT) {
          cache.remove(cache[cache.keys.first]);
        }

        cache[key] = CacheObject(response);
      }
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
