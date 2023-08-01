import 'package:flutter/material.dart';

/// 系统相应状态
class AppState with ChangeNotifier {

  Locale _local = const Locale('en', 'US');

  AppState() {}

  get local => _local;

  setLocal(Locale locale) {
    _local = locale;
    notifyListeners();
  }

}
