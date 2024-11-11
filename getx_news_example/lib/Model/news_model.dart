// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

//定义模型类
class NewsModel {
  String title;
  String shareUrl;
  String author;
  String itemCover;
  int hotValue;
  String hotWords;
  int playCount;
  int diggCount;
  int commentCount;

  NewsModel({
    required this.title,
    required this.shareUrl,
    required this.author,
    required this.itemCover,
    required this.hotValue,
    required this.hotWords,
    required this.playCount,
    required this.diggCount,
    required this.commentCount,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    title: json["title"],
    shareUrl: json["share_url"],
    author: json["author"],
    itemCover: json["item_cover"],
    hotValue: json["hot_value"],
    hotWords: json["hot_words"],
    playCount: json["play_count"],
    diggCount: json["digg_count"],
    commentCount: json["comment_count"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "share_url": shareUrl,
    "author": author,
    "item_cover": itemCover,
    "hot_value": hotValue,
    "hot_words": hotWords,
    "play_count": playCount,
    "digg_count": diggCount,
    "comment_count": commentCount,
  };
}
