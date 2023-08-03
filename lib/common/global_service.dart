import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:wanxia/common/local/storage.dart';
import 'package:wanxia/common/provider/provider.dart';
import 'package:wanxia/pages/user/login.dart';

class GlobalService {
  // static final GlobalService _instance = GlobalService._();
  // GlobalService._();

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  /// 内置存储
  // static late LocalStorage _storage;

  /// 应用状态,
  static AppState appState = AppState(
      local: const Locale('zh', 'CN'),
      themeData: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ));

  /// 权限状态
  static AuthState authState = AuthState();

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
