import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/common/utils/screen.dart';
import 'package:wanxia/generated/l10n.dart';


class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailPageState();
}

class _DetailPageState extends State<Detail> {


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
            width: 375,
            // height: customHeight(130.h),
            child: ElevatedButton(onPressed: () {
              appState.setLocal(Locale('en', 'US'));
              // appState.setIsNeedLogin(true);
              // appState.setLocal(const Locale('zh', 'CN'));
              // appState.setThemeData(ThemeData(
              //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
              //   // useMaterial3: true,
              // ));
            }, child: const Text('清出')),
          ),
        )
      ],
    );
  }


}