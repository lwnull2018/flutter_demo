
import 'dart:convert';

import 'package:dio/dio.dart';

import '../Model/news_model.dart';

class ApiService {

  static Future<List<NewsModel>> fetchNews() async {
    var response = await Dio().get("http://apis.juhe.cn/fapig/douyin/billboard?type=hot_video&size=50&key=9eb8ac7020d9bea6048db1f4c6b6d028");
    if(response.statusCode == 200) {
      var jsonString = response.data['result'];
      return newsModelFromJson(json.encode(jsonString));
    }
    return Future(() => []);
  }

}