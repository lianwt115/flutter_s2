import 'package:flutter/material.dart';
import '../config.dart' ;
import 'navigation_icon_view.dart';
import '../homepage/homepage.dart';
import '../ideapage/ideapage.dart';
import '../mainpage/mainpage.dart';

class Index extends StatefulWidget {

  @override
  State<Index> createState() => new _IndexState();
}

class _IndexState extends State<Index> with TickerProviderStateMixin{

  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  //只会执行一次的状态初始化
  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: new Icon(Icons.assignment),
        title: new Text("首页"),
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.all_inclusive),
        title: new Text("想法"),
        vsync: this,
      ),

      new NavigationIconView(
        icon: new Icon(Icons.perm_identity),
        title: new Text("我的"),
        vsync: this,
      ),
    ];


    for (NavigationIconView view in _navigationViews) {
      view.controller.addListener(_rebuild);
    }

    _pageList = <StatefulWidget>[
      new MainPage(),
      new IdeaPage(),
      new HomePage()
    ];

    //当前显示的page
    _currentPage = _pageList[_currentIndex];
  }

  void _rebuild() {
    //刷新状态后 重新调用build函数
    setState((){});
  }

  //生命周期死亡后 ,不再因状态改变重新渲染
  @override
  void dispose() {
    super.dispose();
    for (NavigationIconView view in _navigationViews) {
      view.controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar bottomNavigationBar = new BottomNavigationBar(
        items: _navigationViews
            .map((NavigationIconView navigationIconView) => navigationIconView.item)
            .toList(),
        currentIndex: _currentIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState((){
            _navigationViews[_currentIndex].controller.reverse();
            _currentIndex = index;
            _navigationViews[_currentIndex].controller.forward();
            _currentPage = _pageList[_currentIndex];
          });
        }
    );

    return new MaterialApp(
        home: new Scaffold(
          body: new Center(
              child: _currentPage
          ),
          bottomNavigationBar: bottomNavigationBar,
        ),
        theme: GlobalConfig.themeData
    );
  }

}