import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

import '../../../widgets/common_swipper.dart';
import '../info/index.dart';
import 'index_navigator.dart';
import 'index_recommend.dart';

class TabIndexPage extends StatefulWidget {

  const TabIndexPage({super.key});

  @override
  State<TabIndexPage> createState() => _TabIndexPageState();

}

class _TabIndexPageState extends State<TabIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SearchBarWidget(
            shwoLocation: true,
            showMap: true,
            onSearch: () {
                Navigator.of(context).pushNamed('/search');
            },
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          //轮播图
          CommonSwipper(),
          //导航栏
          IndexNavigator(),
          //推荐栏
          IndexRecommend(),
          //最新资讯
          Info(showTitle: true,),
        ],
      ),
    );
  }

}
