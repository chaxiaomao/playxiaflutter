import 'package:flutter/material.dart';

/// 系统相应状态
class AppState with ChangeNotifier {

  List<Locale> _local = <Locale>[const Locale('en', 'US')];

  AppState() {}

  get local => _local;

  setLocal(List<Locale> locale) {
    _local = locale;
    notifyListeners();
  }

}
