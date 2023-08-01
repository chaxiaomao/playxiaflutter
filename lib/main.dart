import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/pages/home/home.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  await init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(
          value: appState,
        ),
      ],
      child: Consumer<AppState>(builder: (context, appState, _) {
        print('11111111111111');
        print(appState.local);
        return App();
      }),
    ),
  );
}

AppState appState = AppState();

init() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 设计稿尺寸 统一适配各种尺寸问题
    ScreenUtil.init(context, designSize: const Size(375, 812));
    print('2222222222222');
    print(appState.local);
    return MaterialApp(
      // 多语言环境
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: appState.local,
      // supportedLocales: S.delegate.supportedLocales,
      // supportedLocales: const <Locale>[Locale('zh', 'CN')],

      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const SafeArea(
        child: Scaffold(
          // appBar: PreferredSize(
          //     preferredSize: Size.fromHeisght(55s),
          //     child: AppBar(
          //       backgroundColor: Colors.red,
          //       title: const Text('Hide Status Bar'),
          //     )),
          body: Home(),
        ),
      ),
    );
  }
}
