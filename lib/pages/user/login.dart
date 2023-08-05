import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/provider/auth_state.dart';
import 'package:wanxia/generated/l10n.dart';


class Login extends StatefulWidget {
  const Login({super.key});
  static const String routeName = '/login';

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final authState = Provider.of<AuthState>(context);

    return Stack(
      children: [
        Text(S.of(context).app_name),
        Center(
          child: SizedBox(
            width: 432,
            // height: customHeight(130.h),
            child: ElevatedButton(onPressed: () {
              authState.setIsNeedLogin(false);
              // appState.setLocal(const Locale('zh', 'CN'));
              // appState.setThemeData(ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
              //   // useMaterial3: true,
              // ));
            }, child: const Text('登录')),
          ),
        )
      ],
    );
  }


}