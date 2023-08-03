import 'package:flutter/widgets.dart';

/// 页面公有类
abstract class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);
}

abstract class BaseViewState<View extends BaseView> extends State<View> {
  Widget body();

  @override
  Widget build(BuildContext context) {
    return body();
    // return Consumer<AppState>(builder: (context, state, _) {
    //   return const Home();
    // });
  }
}
