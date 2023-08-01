import 'package:flutter/material.dart';
import 'package:wanxia/common/widgets/kz_app_bar.dart';
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
    return Container(
      child: Text(S.of(context).app_name),
    );
  }


}