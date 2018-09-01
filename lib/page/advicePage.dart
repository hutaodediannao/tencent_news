import 'package:flutter/material.dart';

class AdvicePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AdviceContent();
}

class AdviceContent extends State<AdvicePage>{

  List<Tab> tabs = [
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
    Tab(text: "推荐",),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("推荐"),
          centerTitle: true,
          bottom: TabBar(tabs: tabs, isScrollable: true,),
        ),
        body: TabBarView(children: tabs.map((Tab tab){
          return Center(
            child: Text(tab.text),
          );
        }).toList()),
      ),
    );
  }

}