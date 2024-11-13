import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/home/tab_search/data_list.dart';
import '../widgets/common_floating_button.dart';
import '../widgets/room_list_item_widget.dart';

class RoomManagePage extends StatelessWidget {
  const RoomManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //绑定 TabBar 与 TabBarView
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CommonFloatingButton('发布房源', () {
          Navigator.of(context).pushNamed('/roomAdd');
        }),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('房屋管理'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud_outlined),
                text: '空置',
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
                text: '已租',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: dataList.map((item) => RoomListItem(item)).toList(),
            ),
            ListView(
              children: dataList.map((item) => RoomListItem(item)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

