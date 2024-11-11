//1.新建 /pages/home/index.dart
//2.添加 material、 page_content 依赖
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_index/index.dart';
import 'package:hook_up_rent/pages/home/tab_info/index.dart';
import 'package:hook_up_rent/pages/home/tab_profile/index.dart';
import 'package:hook_up_rent/pages/home/tab_search/index.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

//需要准备4个tab内容区(tabView)
List<Widget> tabViewList = [
  TabIndexPage(),
  TabSearch(),
  TabInfo(),
  TabProfile(),
];

//需要准备4个BottomNavigationBarItem
List<BottomNavigationBarItem> barItemList = [
  BottomNavigationBarItem(label: '首页', icon: Icon(Icons.home), ),
  BottomNavigationBarItem(label: '搜索', icon: Icon(Icons.search), ),
  BottomNavigationBarItem(label: '资讯', icon: Icon(Icons.info), ),
  BottomNavigationBarItem(label: '我的', icon: Icon(Icons.person), ),
];

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //4.使用 PageContent
    return Scaffold(
      body: tabViewList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }

}


