
import 'package:get/get.dart';
import 'package:getx_news_example/service/api_service.dart';

import '../Model/news_model.dart';


class NewsController extends GetxController {

  var isLoading = false.obs;

  var newsList = RxList<NewsModel>();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading(true);
      var news = await ApiService.fetchNews();
      newsList.addAll(news);
    } finally {
      isLoading(false);
    }

  }


}