import 'package:flutter/material.dart';

Widget KzAppBar({required BuildContext context, String title = '', List<Widget>? actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}
