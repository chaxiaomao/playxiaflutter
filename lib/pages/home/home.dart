import 'package:flutter/material.dart';
import 'package:wanxia/pages/demo/detail1.dart';
import 'package:wanxia/pages/home/fragment_comlist.dart';
import 'package:wanxia/pages/user/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  int _bottomTabIndex = 0;

  late PageController _pageController;

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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: "底部底部2"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部3"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部4"),
        ],
        currentIndex: _bottomTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => _pageController.jumpToPage(i),
      ),
    );

  }


}