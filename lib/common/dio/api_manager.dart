import 'package:wanxia/common/dio/http.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._();
  ApiManager._();
  factory ApiManager() => _instance;
  
  Future getComDetailV2(int cid) async {
    var response = await Http().get("/public/api/wxapp/Kzhelp/comDetailv2", params: {'cid': cid});
    print('API manager:');
    print(response);
  }


}