import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wanxia/pages/home/home.dart';

import 'generated/l10n.dart';

Future<void> main() async {

  await init();
  runApp(const App());

}

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
        // useMaterial3: true,
      ),

      // routes: {
      //   '/': (context) => const Home(),
      //   '/login': (context) => const Login(),
      // },

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
