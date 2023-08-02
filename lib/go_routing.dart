import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/global_service.dart';
import 'package:wanxia/pages/detail.dart';
import 'package:wanxia/pages/home/home.dart';
import 'package:wanxia/pages/login.dart';

/// The route configuration.
GoRouter getGoRouting(BuildContext context) {

  final appState = Provider.of<AppState>(context);

  return GoRouter(
    redirect: (BuildContext context, GoRouterState state) async {

      if (appState.isNeedLogin) {
        return '/login';
      }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // state.queryParams['filter']
          return const SafeArea(child: Home());
          // return Consumer<AppState>(builder: (context, state, _) {
          //   return const Home();
          // });
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) => const Detail(),
      )
    ],
    debugLogDiagnostics: false,
  );
}
