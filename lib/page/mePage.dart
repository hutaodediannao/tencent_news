import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MeContent();
}

class MeContent extends State<MePage> {
  List<Tab> tabs = [
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
    Tab(
      text: "我的",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("我的"),
          centerTitle: true,
          bottom: TabBar(
            tabs: tabs,
            isScrollable: true,
          ),
        ),
        body: TabBarView(children: tabs.map((Tab tab) {return Center(child: Text(tab.text),);}).toList()),
      ),
    );
  }
}
