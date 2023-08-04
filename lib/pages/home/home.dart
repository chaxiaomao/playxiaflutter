import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wanxia/common/utils/screen_util.dart';
import 'package:wanxia/common/values/values.dart';
import 'package:wanxia/pages/demo/detail1.dart';
import 'package:wanxia/pages/home/fragment_comlist.dart';
import 'package:wanxia/pages/user/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/';


  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  int _bottomTabIndex = 0;

  late PageController _pageController;

  final _bottomNavigationBars = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "底部底部2"),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部3"),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部4"),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _bottomTabIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChanged(int index) {
    setState(() => _bottomTabIndex = index);
  }

  _bottomNav() {
    return CupertinoTabBar(
      items: _bottomNavigationBars,
      currentIndex: _bottomTabIndex,
      height: setCustomHeight(AppUi.appBottomNavHeight),
      iconSize: setCustomFontSize(AppUi.appBottomNavIconSize),
      border: const Border(
        top: BorderSide(
          color: AppUi.primaryText,
          width: 0.3, // 0.0 means one physical pixel
        ),
      ),
      onTap: (i) => _pageController.jumpToPage(i),

    );
  }

  _bottomNav2() {
    return  BottomNavigationBar(
      items: _bottomNavigationBars,
      currentIndex: _bottomTabIndex,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: setCustomFontSize(AppUi.appBottomNavFontSize),
      unselectedFontSize: setCustomFontSize(AppUi.appBottomNavFontSize),
      iconSize: setCustomFontSize(AppUi.appBottomNavIconSize),
      onTap: (i) => _pageController.jumpToPage(i),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _handlePageChanged,
        children: const <Widget>[
          FragmentComlist(),
          Detail1(),
          FragmentComlist(),
          FragmentComlist(),
        ],
      ),

      bottomNavigationBar: _bottomNav(),

    );

  }


}