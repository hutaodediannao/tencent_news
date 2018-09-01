import 'package:flutter/material.dart';

import 'package:tencent_news/page/advicePage.dart';
import 'package:tencent_news/page/firstPage.dart';
import 'package:tencent_news/page/mePage.dart';
import 'package:tencent_news/page/SecondPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  var _pageController = new PageController(initialPage: 0);

  void _pageChange(int pageIndex) {
    setState(() {
      if (_currentPageIndex != pageIndex) {
        _currentPageIndex = pageIndex;
      }
    });
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _currentPageIndex) {
      return new Text(mTitles[curIndex],style: new TextStyle(color: Colors.red));
    } else {
      return new Text(mTitles[curIndex], style: new TextStyle(color: Colors.black));
    }
  }

  var tabImages;
  var _pages;

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Widget getTabIcon(int curIndex) {
    if (curIndex == _currentPageIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  List<String> mTitles = <String>[
    "新闻",
    "视频",
    "推荐",
    "我的",
  ];

  void initData() {
    widget.title = mTitles[_currentPageIndex];
    /*
      bottom的按压图片
     */
    tabImages = [
      [
        Icon(Icons.list, color: Colors.black,),
        Icon(Icons.list, color: Colors.red,),      ],
      [
        Icon(Icons.add, color: Colors.black,),
        Icon(Icons.add, color: Colors.red,),      ],
      [
        Icon(Icons.star, color: Colors.black,),
        Icon(Icons.star, color: Colors.red,),
      ],
      [
        Icon(Icons.person, color: Colors.black,),
        Icon(Icons.person, color: Colors.red,),
      ]
    ];

    _pages = [
      new FirstPage(),
      new SecondPage(),
      new AdvicePage(),
      new MePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//        centerTitle: true,
//      ),
      body: new PageView.builder(
        itemBuilder: (context, index) {
          return _pages[_currentPageIndex];
        },
        itemCount: mTitles.length,
        onPageChanged: _pageChange,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
        ],
        currentIndex: _currentPageIndex,
        onTap: (int pageIndex) {
          _pageController.animateToPage(
            pageIndex,
            duration: Duration(seconds: 2),
            curve: ElasticInCurve(0.8),
          );
          _pageChange(pageIndex);
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
