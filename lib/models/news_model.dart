import 'package:news_app/models/sources_model.dart';

class NewsModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel({this.status, this.totalResults, this.articles});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    articles = json["articles"] == null
        ? null
        : (json["articles"] as List).map((e) => Articles.fromJson(e)).toList();
  }

  static List<NewsModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(NewsModel.fromJson).toList();
  }
}

class Articles {
  Sources? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json["source"] == null ? null : Sources.fromJson(json["source"]);
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    publishedAt = json["publishedAt"];
    content = json["content"];
  }

  static List<Articles> fromList(List<Map<String, dynamic>> list) {
    return list.map(Articles.fromJson).toList();
  }
}
