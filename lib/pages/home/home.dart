import 'package:flutter/material.dart';
import 'package:wanxia/pages/home/fragment_comlist.dart';
import 'package:wanxia/pages/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomePageState();
}

class _HomePageState extends State<Home> {

  int _bottomTabIndex = 0;

  static const _bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "底部底部2"),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部3"),
    BottomNavigationBarItem(icon: Icon(Icons.school), label: "底部底部4"),
  ];

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
          FragmentComlist(),
          FragmentComlist(),
          FragmentComlist(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNav,
        currentIndex: _bottomTabIndex,
        // fixedColor: AppColors.primaryElement,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => _pageController.jumpToPage(i),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      ),
    );

    // return DefaultTabController(
    //   length: 3,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       backgroundColor:Colors.redAccent,
    //       elevation: 0,
    //       bottom: const TabBar(
    //         labelColor:Colors.redAccent,
    //         unselectedLabelColor:Colors.white,
    //         indicatorSize: TabBarIndicatorSize.label,
    //         indicator:BoxDecoration(
    //           color:Colors.white,
    //           borderRadius:BorderRadius.only(
    //             topLeft:Radius.circular(10),
    //             topRight:Radius.circular(10),
    //           ),
    //         ),
    //         tabs: [
    //           Tab(
    //             child:Align(
    //               alignment:Alignment.center,
    //               child:Text("APPS"),
    //             ),
    //           ),
    //           Tab(
    //             child:Align(
    //               alignment:Alignment.center,
    //               child:Text("MOVIES"),
    //             ),
    //           ),
    //           Tab(
    //             child:Align(
    //               alignment:Alignment.center,
    //               child:Text("GASMES"),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: const TabBarView(
    //       children: [
    //         Icon(Icons.apps),
    //         Icon(Icons.movie),
    //         Icon(Icons.games),
    //       ],
    //     ),
    //   ),
    // );

  }


}