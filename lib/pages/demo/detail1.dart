import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/app_service.dart';
import 'package:wanxia/provider/auth_state.dart';
import 'package:wanxia/pages/base_view.dart';


class Detail1 extends BaseView {
  const Detail1({super.key});

  @override
  State<Detail1> createState() => _DetailPageState();
}

class _DetailPageState extends BaseViewState<Detail1> {


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget body() {

    final authState = Provider.of<AuthState>(context);

    // TODO: implement body
    return Stack(
      children: [
        Text(authState.name),
        Center(
          child: SizedBox(
            width: 375.w,
            // height: customHeight(130.h),
            child: ElevatedButton(onPressed: () {

              AppService.needLogin();

              // appState.setLocal(Locale('en', 'US'));

              // appState.setLocal(const Locale('zh', 'CN'));
              // appState.setThemeData(ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
              //   // useMaterial3: true,
              // ));
            }, child: const Text('模拟需要触发登录界面')),
          ),
        )
      ],
    );
  }


}