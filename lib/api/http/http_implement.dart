

import 'http_client.dart';

class HttpImplement<T extends HttpClient>{
  late T request;

  Future requestGet(path, dynamic data) {
    return request.get(path, dynamic);
  }

  Future requestPost(path, dynamic) {
    return request.get(path, dynamic);
  }

}