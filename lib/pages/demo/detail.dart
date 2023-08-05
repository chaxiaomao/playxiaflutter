import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/provider/auth_state.dart';
import 'package:wanxia/generated/l10n.dart';
import 'package:wanxia/pages/base_view.dart';


class Detail extends BaseView {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailPageState();
}

class _DetailPageState extends BaseViewState<Detail> {

  @override
  void initState() {
    super.initState();
  }

  // @override
  // Widget build(BuildContext context) {
  //
  //   final appState = Provider.of<AppState>(context);
  //
  //   return Stack(
  //     children: [
  //       Text(S.of(context).app_name),
  //       Center(
  //         child: SizedBox(
  //           width: 375,
  //           // height: customHeight(130.h),
  //           child: ElevatedButton(onPressed: () {
  //             // appState.setLocal(Locale('en', 'US'));
  //             appState.setIsNeedLogin(true);
  //             // appState.setLocal(const Locale('zh', 'CN'));
  //             // appState.setThemeData(ThemeData(
  //             //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
  //             //   // useMaterial3: true,
  //             // ));
  //           }, child: const Text('清出')),
  //         ),
  //       )
  //     ],
  //   );
  // }

  @override
  Widget body() {
    final authState = Provider.of<AuthState>(context);
    // TODO: implement body
    return Stack(
      children: [
        Text(S.of(context).app_name),
        Center(
          child: SizedBox(
            width: 375,
            // height: customHeight(130.h),
            child: ElevatedButton(onPressed: () {

              authState.setName('WWWWWWW');

              // appState.setLocal(Locale('en', 'US'));

              // appState.setLocal(const Locale('zh', 'CN'));
              // appState.setThemeData(ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
              //   // useMaterial3: true,
              // ));
            }, child: const Text('改变状态')),
          ),
        )
      ],
    );
  }


}