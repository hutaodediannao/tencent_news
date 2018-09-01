import 'package:flutter/material.dart';
import 'package:tencent_news/page/data.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FirstContent();
}

class FirstContent extends State<FirstPage> {
  List<Tab> tabs = [
    Tab(
      text: "要闻",
      key: Key("1"),
    ),
    Tab(
      text: "图片",
      key: Key("2"),
    ),
    Tab(
      text: "视频",
      key: Key("3"),
    ),
    Tab(
      text: "国际",
      key: Key("4"),
    ),
    Tab(
      text: "科技",
      key: Key("5"),
    ),
    Tab(
      text: "汽车",
      key: Key("6"),
    ),
    Tab(
      text: "数码",
      key: Key("7"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("新闻"),
          centerTitle: true,
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(
          children: tabs.map((Tab tab) {
            return AppData().getDataByTab(tab, context);
          }).toList(),
        ),
      ),
    );
  }
}
