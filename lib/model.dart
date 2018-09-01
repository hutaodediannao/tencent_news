
//新闻model
class NewsModel{
  String title;
  String desc;
  String imgUrl;

  NewsModel(this.title, this.desc, this.imgUrl);
}

//图片model
class ImageModel{
  String imagUrl;

  ImageModel(this.imagUrl);
}

//视频
class VideoModel{
  String videoUrl;
  String imageUrl;
  String title;

  VideoModel(this.videoUrl, this.imageUrl, this.title);
}