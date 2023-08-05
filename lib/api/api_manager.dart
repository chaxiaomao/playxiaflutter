
import 'package:wanxia/api/dio/http.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._();
  ApiManager._();
  factory ApiManager() => _instance;
  static final _httpClient = DioClient();
  
  Future getComDetailV2(int cid) async {
    var response = await _httpClient.get("/public/api/wxapp/Kzhelp/comDetailv2", params: {'cid': cid});
    print('ApiManager.getComDetailV2:');
    print(response);
  }


}