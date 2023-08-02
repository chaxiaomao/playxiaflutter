import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/app.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/global_service.dart';

Future<void> main() async {
  await GlobalService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(
          value: GlobalService.appState,
        ),
      ],
      child: const App(),
      // child: Consumer<AppState>(builder: (context, appState, _) {
      //   print('===================APP RUN===================');
      //   return App(); /// 不能加 const
      // }),
    ),
  );
}
