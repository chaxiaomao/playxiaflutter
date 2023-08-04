import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Message {

  static Future<bool?> showToast(msg) async {
    return await Fluttertoast.showToast(
        msg:  msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        // textColor: Colors.white,
        // fontSize: 16.0
    );
  }
}