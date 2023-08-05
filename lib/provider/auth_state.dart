import 'package:flutter/material.dart';

/// 用户的权限状态控制
class AuthState with ChangeNotifier {

  /// 用户信息
  String name = '';
  int unreadMsg = 0;

  /// example
  late bool isNeedLogin;

  AuthState();

  setIsNeedLogin(bool f) {
    isNeedLogin = f;
    notifyListeners();
  }

  updateUnreadMsg(int n) {
    unreadMsg += n;
    notifyListeners();
  }

}
