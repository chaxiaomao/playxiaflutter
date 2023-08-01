import 'package:flutter/material.dart';
import 'package:wanxia/pages/home/fragment_comlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _bottomNavPages = [];

  static const _bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "底部底部2"),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部3"),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部4"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _bottomNavPages
      ..add(const FragmentComlist())
      ..add(const FragmentComlist())
      ..add(const FragmentComlist())
      ..add(const FragmentComlist());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() => _selectedIndex = index);
      // title = _bottomNav[index].label!;
    }

    return Stack(
      children: [
        Scaffold(
          body: _bottomNavPages[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 14,
            unselectedFontSize: 14,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            items: _bottomNav,
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
          ),
        ),
      ],
    );
  }
}
