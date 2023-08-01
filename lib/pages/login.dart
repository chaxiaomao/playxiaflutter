import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/common/utils/screen.dart';
import 'package:wanxia/generated/l10n.dart';


class Login extends StatefulWidget {
  const Login({super.key});

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

    final appState = Provider.of<AppState>(context);

    return Stack(
      children: [
        Text(S.of(context).app_name),
        Center(
          child: SizedBox(
            width: 432,
            // height: customHeight(130.h),
            child: ElevatedButton(onPressed: () {

              appState.setLocal(const Locale('zh', 'CN'));
            }, child: const Text('切换老中')),
          ),
        )
      ],
    );
  }


}