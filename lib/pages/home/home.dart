import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/utils/screen_util.dart';
import 'package:wanxia/common/values/values.dart';
import 'package:wanxia/pages/demo/detail1.dart';
import 'package:wanxia/pages/home/fragment_comlist.dart';
import 'package:wanxia/provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = '/';

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  // 底部菜单选中
  int currentBottomTabIndex = 0;

  late PageController pageController;

  final fragments = <Widget>[
    const FragmentComlist(),
    const Detail1(),
    const FragmentComlist(),
    const FragmentComlist(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentBottomTabIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _handlePageChanged(int index) {
    setState(() => currentBottomTabIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: _handlePageChanged,
        children: fragments,
      ),
      bottomNavigationBar: _bottomNav(style: 1),
    );
  }

  // 底部菜单
  Widget _bottomNav({style = 1}) {
    List<BottomNavigationBarItem> bottomTabItems = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
      BottomNavigationBarItem(
        icon: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [const Icon(Icons.home), _badge()],
        ),
        label: "消息",
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "积分"),
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "我的"),
    ];
    if (style == 1) {
      return CupertinoTabBar(
        items: bottomTabItems,
        currentIndex: currentBottomTabIndex,
        // height: setCustomHeight(AppStyle.appBottomNavHeight),
        // iconSize: setCustomFontSize(AppStyle.appBottomNavIconSize),
        // border: const Border(
        //   top: BorderSide(
        //     color: AppStyle.primaryText,
        //     width: 0.3, // 0.0 means one physical pixel
        //   ),
        // ),
        onTap: (i) => pageController.jumpToPage(i),
      );
    }
    return BottomNavigationBar(
      items: bottomTabItems,
      currentIndex: currentBottomTabIndex,
      type: BottomNavigationBarType.fixed,
      // selectedFontSize: setCustomFontSize(AppStyle.appBottomNavFontSize),
      // unselectedFontSize: setCustomFontSize(AppStyle.appBottomNavFontSize),
      // iconSize: setCustomFontSize(AppStyle.appBottomNavIconSize),
      onTap: (i) => pageController.jumpToPage(i),
    );
  }

  // 底部菜单消息小红点
  Widget _badge() {
    final authState = Provider.of<AuthState>(context);
    int unreadMsg = authState.unreadMsg;

    if (unreadMsg > 0) {
      return Container(
        width: setCustomWidth(14.0),
        height: setCustomHeight(14.0),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        constraints: BoxConstraints(
          minWidth: setCustomWidth(14.0),
          minHeight: setCustomHeight(14.0),
        ),
        child: Center(
          child: Text(
            authState.unreadMsg.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
          ),
        ),
      );
    }
    return SizedBox(height: setCustomHeight(14.0), width: setCustomWidth(14.0));
  }
}
