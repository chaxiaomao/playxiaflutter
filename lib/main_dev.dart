import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/env.dart';
import 'package:wanxia/common/provider/provider.dart';
import 'package:wanxia/app.dart';
import 'package:wanxia/common/global_service.dart';
Future<void> main() async {
  EnvironmentBuild.init(flavor: BuildFlavor.development);
  await GlobalService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(
          value: GlobalService.appState,
        ),
        ChangeNotifierProvider<AuthState>.value(
          value: GlobalService.authState,
        ),
      ],
      child: const App(),
    ),
  );
}
