import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/env.dart';
import 'package:wanxia/common/provider/provider.dart';
import 'package:wanxia/app.dart';

import 'app_service.dart';
Future<void> main() async {
  EnvironmentBuild.init(flavor: BuildFlavor.production);
  await AppService.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(
          value: AppService.appState,
        ),
        ChangeNotifierProvider<AuthState>.value(
          value: AppService.authState,
        ),
      ],
      child: const App(),
    ),
  );
}
