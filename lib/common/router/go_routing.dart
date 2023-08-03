import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:wanxia/common/global_service.dart';
import 'package:wanxia/pages/demo/detail.dart';
import 'package:wanxia/pages/home/home.dart';
import 'package:wanxia/pages/user/login.dart';

/// The route configuration.
GoRouter getGoRouting(BuildContext context) {

  // final authState = Provider.of<AuthState>(context);

  return GoRouter(
    navigatorKey: GlobalService.navigatorKey,
    redirect: (BuildContext context, GoRouterState state) async {

      // if (authState.isNeedLogin) {
      //   return '/login';
      // }

      return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          // state.queryParams['filter']
          return const SafeArea(child: Home());
        },
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/detail',
        builder: (context, state) => const Detail(),
      ),
    ],
    debugLogDiagnostics: false,
  );
}
