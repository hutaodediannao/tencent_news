import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SecondContent();
}

class SecondContent extends State<SecondPage>{

  List<Tab> tabs = [
    Tab(text: "视频",),
    Tab(text: "视频",),
    Tab(text: "视频",),
    Tab(text: "视频",),
    Tab(text: "视频",),
    Tab(text: "视频",),
    Tab(text: "视频",),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("视频"),
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