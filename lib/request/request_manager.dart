
import 'package:wanxia/request/dio/dio_client.dart';

class RequestManager {
  static final RequestManager _instance = RequestManager._();
  RequestManager._();
  factory RequestManager() => _instance;
  static final _httpClient = DioClient();
  
  Future getComDetailV2(int cid) async {
    var response = await _httpClient.get("/public/api/wxapp/Kzhelp/comDetailv2", params: {'cid': cid});
    print('ApiManager.getComDetailV2:');
    print(response);
  }


}