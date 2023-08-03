import 'package:flutter/material.dart';

/// 用户的权限状态控制
class AuthState with ChangeNotifier {

  /// 用户信息
  String name = 'ding dong ji';

  /// example
  bool isNeedLogin;

  AuthState({this.isNeedLogin = false});

  setIsNeedLogin(bool f) {
    isNeedLogin = f;
    notifyListeners();
  }

  setName(n) {
    name = n;
    notifyListeners();
  }

}
