import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_news_example/controller/news_controller.dart';

class NewsView extends StatelessWidget {

  var newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('新闻示例'),),
      body: Obx(() {
        if (newsController.isLoading.value) {
          return const CircularProgressIndicator();
        } else {
          return ListView.builder(
              itemCount: newsController.newsList.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 120,
                          margin: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.0),
                            child: Image.network(
                              newsController.newsList[index].itemCover,
                              width: 150,
                              height: 100,
                              fit: BoxFit.fill,
                              // color: Colors.lightGreen,
                            ),
                          ),
                        ),
                        Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  newsController.newsList[index].author,
                                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                                )
                              ],
                            )
                        ),
                        Container(
                          color: Colors.grey,
                          height: 2,
                        )
                      ],
                    )
                  ],
                );
              }
          );
        }
      }),
    );
  }

}
