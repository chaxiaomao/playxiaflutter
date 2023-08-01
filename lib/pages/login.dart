import 'package:flutter/material.dart';
import 'package:wanxia/common/utils/screen.dart';


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

    return Center(
      child: SizedBox(
        width: setCustomWidth(375),
        child: ElevatedButton(onPressed: () {

        }, child: const Text('')),
      ),
    );

    // return Container(
    //   child: Text(S.of(context).app_name, style: TextStyle(fontSize: customFontSize(24.sp)),),
    // );
  }


}