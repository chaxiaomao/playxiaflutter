import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanxia/common/utils/utils.dart';
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
  int _jobTypeIndex = 0;
  static const List<Map<String, dynamic>> _jobType = [
    {
      "label": '按时结算',
      "value": 1,
    },
    {
      "label": '按月结算',
      "value": 2,
    }
  ];
  int _expandType = 0;
  final GlobalKey _advanceSearchKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initTabController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = Provider.of<AuthState>(context);
    final appState = Provider.of<AppState>(context);

    return DefaultTabController(
      //tabBar初始化控制器
      length: _jobType.length,
      initialIndex: 0,
      child: Stack(
        children: [

          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(AppStyle.appBarHeight),
              child: AppBar(
                centerTitle: true,
                elevation: 0,
                title: _jobTypeTabs(),
              ),
            ),
            body: Column(
              children: [
                /// 筛选梡
                _advanceTabs(),
                /// 列表框
                Stack(
                  children: [
                    Text('ssss'),
                    _toggleAdvanceTab()
                  ],
                )
              ],
            ),
          ),

          /// 蒙层
          // Positioned(
          //   top: 0,
          //   left: 50,
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.red,
          //   ),
          // ),
          /// 蒙层
        ],
      ),
    );
  }

  _toggle(t) {
    setState(() {
      if (t == _expandType) {
        _expandType = 0;
      } else {
        _expandType = t;
      }
    });
  }

  Widget _toggleAdvanceTab() {


    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   // 获取组件的 BuildContext
    //   var c = _advanceSearchKey.currentContext;
    //
    //   // 获取组件的 RenderObject
    //   RenderObject? renderBox = c?.findRenderObject();
    //
    //   // 获取组件的边界框
    //   Rect? componentBounds = renderBox?.paintBounds;
    //   print(componentBounds?.height);
    // });

    // double screenHeight = MediaQuery.of(context).size.height;
    // double appBarHeight = AppBar().preferredSize.height;
    // double bottomNavBarHeight = kBottomNavigationBarHeight;
    //
    // // 获取组件的 BuildContext
    // var c = _advanceSearchKey.currentContext;
    // RenderObject? renderBox = c?.findRenderObject();
    // Rect? componentBounds = renderBox?.paintBounds;
    // double? h1 = componentBounds?.height;
    // if (h1 == null) {
    //   return Container();
    // }
    // double availableHeight = screenHeight - appBarHeight - bottomNavBarHeight - h1 - 2;
    //
    // print(h1);
    // print(availableHeight);
    ///
    if (_expandType == 1) {
      return AnimatedContainer(
        height:290,
        color: Colors.black.withOpacity(.5),
        // alignment: Alignment.center,
        duration: const Duration(milliseconds: 200),
        child: Transform.translate(
          offset: const Offset(0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox.fromSize(
                size: Size.fromHeight(30),
                child: Container(
                  constraints: BoxConstraints(maxHeight: 30),
                  alignment: Alignment.centerLeft,
                  child: Text('item1'),
                ),
              ),
              Expanded(child: Container(
                height: 30,
                constraints: BoxConstraints(maxHeight: 30),
                alignment: Alignment.centerLeft,
                child: Text('item1'),
              )),
              Expanded(
                child: Container(
                  height: 30,
                  constraints: BoxConstraints(maxHeight: 30),
                  alignment: Alignment.centerLeft,
                  child: Text('item1'),
                ),
              ),
            ],
          ),
        ),
      );


    }

    return AnimatedContainer(
      height: 0,
      // alignment: Alignment.center,
      duration: const Duration(milliseconds: 200),
      child: Container(),
    );
  }

  // Widget _toggleAdvanceTab() {
  //
  //   Widget content = Container();
  //   double h = 0;
  //
  //
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   // 获取组件的 BuildContext
  //   //   var c = _advanceSearchKey.currentContext;
  //   //
  //   //   // 获取组件的 RenderObject
  //   //   RenderObject? renderBox = c?.findRenderObject();
  //   //
  //   //   // 获取组件的边界框
  //   //   Rect? componentBounds = renderBox?.paintBounds;
  //   //   print(componentBounds?.height);
  //   // });
  //
  //   double screenHeight = MediaQuery.of(context).size.height;
  //   double appBarHeight = AppBar().preferredSize.height;
  //   double bottomNavBarHeight = kBottomNavigationBarHeight;
  //
  //   // 获取组件的 BuildContext
  //   var c = _advanceSearchKey.currentContext;
  //   RenderObject? renderBox = c?.findRenderObject();
  //   Rect? componentBounds = renderBox?.paintBounds;
  //   double? h1 = componentBounds?.height;
  //   if (h1 == null) {
  //     return Container();
  //   }
  //   double availableHeight = screenHeight - appBarHeight - bottomNavBarHeight - h1 - 2;
  //
  //   print(h1);
  //   print(availableHeight);
  //   ///
  //   if (_expandType == 1) {
  //     h = setCustomWidth(120);
  //     // h = availableHeight;
  //     content = Container(
  //       color: Colors.white,
  //       height: h,
  //       padding: EdgeInsets.only(left: setCustomWidth(10), right: setCustomWidth(10)),
  //       child: Column(
  //         // mainAxisAlignment: MainAxisAlignment.center,
  //         // crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           Container(
  //             height: 30,
  //             alignment: Alignment.centerLeft,
  //             color: Colors.green,
  //             child: Text('item1'),
  //           ),
  //           Container(
  //             height: 30,
  //             alignment: Alignment.centerLeft,
  //             color: Colors.blue,
  //             child: Text('item1'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  //
  //   return Container(
  //     color: Colors.black.withOpacity(.5),
  //     height: availableHeight,
  //     child: AnimatedContainer(
  //       height: h,
  //       // alignment: Alignment.center,
  //       duration: const Duration(milliseconds: 200),
  //       child: Transform.translate(
  //         offset: const Offset(0, 0),
  //         child: content,
  //       ),
  //     ),
  //   );
  // }

  Widget _advanceTabs() {
    return Container(
      key: _advanceSearchKey,
      height: setCustomHeight(55),
      padding: EdgeInsets.all(setCustomWidth(10)),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 0.5, color: Colors.grey)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () => _toggle(1),
              child: Text(
                '地区',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '搜索',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '搜索',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '搜索',
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }

  // tabController初始化
  void _initTabController() {
    _tabController = TabController(length: _jobType.length, vsync: this);
    _tabController.addListener(() {
      setState(() => _jobTypeIndex = _tabController.index);

      //点击tab回调一次，滑动切换tab不会回调
      // if(_tabController.indexIsChanging){
      //   print("ysl--${_tabController.index}");
      // }

      //点击tab时或滑动tab回调一次
      // if(_tabController.index.toDouble() == _tabController.animation.value){
      // }
    });
  }

  ///Tab
  Widget _jobTypeTabs() {
    return SizedBox(
        height: setCustomHeight(44.0),
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
            tabs: _jobType.map((e) => Tab(text: e['label'])).toList(),
          ),
        ));
  }
}
