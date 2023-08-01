import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wanxia/pages/home/home.dart';

import 'generated/l10n.dart';

void main() {

  runZonedGuarded(() {

      ErrorWidget.builder = (FlutterErrorDetails details) {
        print('dddx');
        Zone.current.handleUncaughtError(details.exception, details.stack!);

        ///此处仅为展示，正规的实现方式参考 _defaultErrorWidgetBuilder 通过自定义 RenderErrorBox 实现
        // return ErrorPage(details.exception.toString() + "\n " + details.stack.toString(), details);
        return CustomErrorWidget(details);
        print(details.exception.toString() + "\n " + details.stack.toString());
      };
      runApp(const App());
  }, (Object error, StackTrace stack) {
    print('Uncaught error: $error');
    print("expectinTest zone error ${stack.toString()}");
  });

  // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
  // SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  CustomErrorWidget(this.errorDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: Text(
        'Custom Error Widget: ${errorDetails.exception} from ${S.of(context).app_name}',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // 多语言环境
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,// supportedLocales: const <Locale>[Locale('zh', 'CN')],

      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
