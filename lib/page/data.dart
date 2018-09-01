import 'package:flutter/material.dart';
import 'package:tencent_news/model.dart';
import 'package:flutter_simple_video_player/flutter_simple_video_player.dart';

class AppData {
//1.要闻
  Widget getDataByTab(Tab tab, BuildContext c) {
    switch (tab.text) {
      case "要闻":
        return getNewsModelBody(c);
      case "图片":
        return getImageBody();
      case "视频":
        return getVideoDataWidget(c);
        break;
      case "国际":
        break;
      case "科技":
        break;
      case "汽车":
        break;
      case "数码":
        break;
    }
    return getImageBody();
  }

  /**
   * 1.获取新闻列表数据
   */
  final List<NewsModel> newsModels = new List();

  Widget getNewsModelBody(BuildContext c) {
    NewsModel newsModel0 = new NewsModel(
        "今天晚上真的是太热闹了！今晚苹果也加入了混战！",
        "本周天气一直下雨哦，呵呵",
        "http://image.uczzd.cn/15871293686666959785.jpg?id=0&from=export");
    NewsModel newsModel1 = new NewsModel(
        "图为大众途锐，一款与奥迪Q7和保时捷卡宴同平台的车型。",
        "本周天气一直下雨哦，呵呵",
        "http://image.uczzd.cn/15599134412851693134.jpg?id=0&from=export");
    NewsModel newsModel2 = new NewsModel(
        "卡西欧推出Pro Trek Smart系列智能手表新品: OLED屏幕",
        "本周天气一直下雨哦，呵呵",
        "http://image.uczzd.cn/15242506309342179507.jpg?id=0&from=export");
    newsModels.add(newsModel0);
    newsModels.add(newsModel1);
    newsModels.add(newsModel2);

    List<Widget> children = <Widget>[];
    newsModels.forEach((f) {
      children.add(Padding(
          padding: EdgeInsets.fromLTRB(5.0, 2.5, 5.0, 0.0),
          child: Card(
            child: Stack(
              overflow: Overflow.clip,
              children: <Widget>[
                Image.network(
                  f.imgUrl,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(c).size.width,
                  height: 200.0,
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    child: Text(
                      f.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(0.0, 170.0, 0.0, 0.0),
                    color: Colors.black,
                    height: 30.0,
                  ),
                )
              ],
            ),
          )));
    });

    return Center(
      child: ListView(
        children: children,
      ),
    );
  }

//2.图片
  final news = <String>[
    "http://image.uczzd.cn/2419857321972973352.jpg?id=0&from=export&height=140&width=270",
    "http://image.uczzd.cn/9397884553500548569.jpg?id=0&from=export&height=140&width=270",
    "http://image.uczzd.cn/6464978779401517729.jpg?id=0&from=export&height=140&width=270",
    "http://image.uczzd.cn/8425972641748530328.jpg?id=0&from=export&height=140&width=270",
    "http://image.uczzd.cn/6960477503621274756.jpg?id=0&from=export&height=140&width=270",
  ];

  /**
   * 2.获取图片列表数据
   */
  Widget getImageBody() {
    List<Widget> children = new List();
    news.forEach((f) {
      children.add(Padding(
          padding: EdgeInsets.all(5.0),
          child: Card(
            child: Image.network(
              f,
              fit: BoxFit.fill,
            ),
          )));
    });

    return Center(
      child: ListView(
        children: children,
      ),
    );
  }

  List<VideoModel> videos = <VideoModel>[];

//3.视频播放
  Widget getVideoDataWidget(BuildContext context) {
    List<Widget> widgets = <Widget>[];

    return Container(

      child: ListView(
        children: <Widget>[
          RaisedButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoFullPage('https://youku.cdn-56.com/20180622/3878_d3968706/index.m3u8',)),
            );
          }, child: Text("full play video"),),
          Container(
            height: 256.0,
            color: Colors.black,
            child: Center(
              child: NetVideo("https://youku.cdn-56.com/20180622/3878_d3968706/index.m3u8"),
            ),
          ),Container(
            height: 256.0,
            color: Colors.black,
            child: Center(
              child: NetVideo("https://youku.cdn-56.com/20180622/3878_d3968706/index.m3u8"),
            ),
          ),Container(
            height: 256.0,
            color: Colors.black,
            child: Center(
              child: NetVideo("https://youku.cdn-56.com/20180622/3878_d3968706/index.m3u8"),
            ),
          ),
        ],
      ),

    );

  }
}
