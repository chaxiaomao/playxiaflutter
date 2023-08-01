import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/provider/app_state.dart';
import 'package:wanxia/generated/l10n.dart';
class FragmentComlist extends StatefulWidget {
  const FragmentComlist({super.key});

  @override
  State<FragmentComlist> createState() => _FragmentComlistState();
}

class _FragmentComlistState extends State<FragmentComlist> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
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

              appState.setLocal(<Locale>[const Locale('zh', 'CN')]);
            }, child: const Text('切换老中')),
          ),
        )
      ],
    );

    // return SizedBox(
    //   width: customWidth(30.w),
    //   height: customHeight(30.h),
    //   child: ElevatedButton(onPressed: () {
    //
    //   }, child: const Text('an niu')),
    // );
  }

}