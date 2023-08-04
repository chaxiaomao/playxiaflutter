import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:wanxia/common/provider/provider.dart';
import 'package:wanxia/common/values/app_ui.dart';

class AppService {
  // static final GlobalService _instance = GlobalService._();
  // GlobalService._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// 内置存储
  // static late LocalStorage _storage;

  /// 权限状态
  static AuthState authState = AuthState();

  /// 应用状态,
  static AppState appState = AppState(
      local: const Locale('zh', 'CN'),
      themeData: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppUi.primaryElement),
        // useMaterial3: true,
      ));

  /// todo 应用信息
  /// 设备信息 当前版本 等等

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    // await LocalStorage.init();

    /// 透明状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle style = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(style);
    }
  }

  static forceLogin() {
    BuildContext context = navigatorKey.currentState!.context;
    context.go('/login');
  }

  static needLogin() {
    BuildContext? context = navigatorKey.currentState?.context;
    context?.push('/login');
    // Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Login()));
  }

}
