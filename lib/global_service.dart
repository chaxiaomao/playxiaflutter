import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/common/utils/storage.dart';

class GlobalService {
  // static final GlobalService _instance = GlobalService._();
  // GlobalService._();

  /// 内置存储
  static late Storage _storage;

  /// 应用状态,
  static AppState appState = AppState(
      local: const Locale('zh', 'CN'),
      themeData: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ));

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Storage.init();

    /// 透明状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }
}
