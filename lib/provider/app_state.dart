import 'package:flutter/material.dart';

/// APP 语言/主题/路由重定向等状态变量
/// 根节点消费
/// 根节点重载
class AppState with ChangeNotifier {
  Locale ?local;
  ThemeData ?themeData;

  AppState({this.local, this.themeData});

  // AppState() {
  //   _local = const Locale('zh', 'CN');
  //   _isNeedLogin = false;
  //   _themeData = ThemeData(
  //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //     // useMaterial3: true,
  //   );
  // }

  // get local => _local;
  //
  // get isNeedLogin => _isNeedLogin;
  //
  // get themeData => _themeData;

  setLocal(Locale l) {
    local = l;
    notifyListeners();
  }

  setThemeData(ThemeData t) {
    themeData = t;
    notifyListeners();
  }
}
