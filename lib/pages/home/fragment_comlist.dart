import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/values/values.dart';
import 'package:wanxia/generated/l10n.dart';
import 'package:wanxia/provider/provider.dart';
import 'package:wanxia/widgets/bottom_navgiator_badge.dart';

class FragmentComlist extends StatefulWidget {
  const FragmentComlist({super.key});

  @override
  State<FragmentComlist> createState() => _FragmentComlistState();
}

class _FragmentComlistState extends State<FragmentComlist> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _workTypeIndex = 0;
  final List<Map<String, dynamic>> _workType = [
    {
      "label": '按时结算',
      "value": 1,
    },
    {
      "label": '按月结算',
      "value": 2,
    }
  ];

  @override
  void initState() {
    super.initState();
    _initTabController();
  }

  // tabController初始化
  void _initTabController() {
    _tabController = TabController(length: _workType.length, vsync: this);
    _tabController.addListener(() {
      setState(() => _workTypeIndex = _tabController.index);

      //点击tab回调一次，滑动切换tab不会回调
      // if(_tabController.indexIsChanging){
      //   print("ysl--${_tabController.index}");
      // }

      //点击tab时或滑动tab回调一次
      // if(_tabController.index.toDouble() == _tabController.animation.value){
      // }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  BottomNavigationBadge badger = BottomNavigationBadge(
      backgroundColor: Colors.red,
      badgeShape: BottomNavigationBadgeShape.circle,
      textColor: Colors.white,
      position: BottomNavigationBadgePosition.topRight,
      textSize: 8);

  @override
  Widget build(BuildContext context) {

    final authState = Provider.of<AuthState>(context);
    final appState = Provider.of<AppState>(context);

    return DefaultTabController(
      //tabBar初始化控制器
      length: _workType.length,
      initialIndex: 0,
      child: Row(
        children: [
          // Text(S.of(context).app_name),
          ElevatedButton(onPressed: () {

            // appState.setLocal(Locale('en', 'US'));
            authState.updateUnreadMsg(1);

          }, child: const Text('未读信息'))
        ],
      ),
      // child: Scaffold(
      //   appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(AppStyle.appBarHeight),
      //     child: AppBar(
      //       centerTitle: true,
      //       title: _tab(),
      //     ),
      //   ),
      // ),
    );
  }

  ///Tab
  _tab() {
    return SizedBox(
        width: 186,
        height: AppStyle.appBarHeight,
        child: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused) ? null : Colors.transparent;
              },
            ),
            controller: _tabController,
            indicatorWeight: 3.0,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: _workType.map((e) => Tab(text: e['label'])).toList(),
          ),
        ));
  }
}
