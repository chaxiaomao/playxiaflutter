
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/global_service.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/generated/l10n.dart';
import 'package:wanxia/common/router/go_routing.dart';

// final GlobalKey navigatorKey = GlobalKey();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    // APP 配置/状态控制
    final appState = Provider.of<AppState>(context);

    // 设计稿尺寸 统一适配各种尺寸问题
    ScreenUtil.init(context, designSize: const Size(375, 812));

    print('++++++++++++++++++++APP Build++++++++++++++++++++');

    return MaterialApp.router(

      /// 多语言
      locale: appState.local,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      ///
      title: 'Flutter App',

      ///
      debugShowCheckedModeBanner: false,

      /// 主题切换
      theme: appState.themeData,

      /// 路由表
      routerConfig: getGoRouting(context),


      // home: const SafeArea(
      //   child: Home(),
      // ),
    );



  }

}
