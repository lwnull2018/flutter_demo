import 'package:flutter/material.dart';

import '../../../widgets/room_list_item_widget.dart';
import 'data_list.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';

//搜索组件
class TabSearch extends StatefulWidget {

  const TabSearch({super.key});

  @override
  State<TabSearch> createState() => _TabSearchState();

}

class _TabSearchState extends State<TabSearch> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SearchBarWidget(
          shwoLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('/search');
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: ListView(
                  children: dataList.map((item) => RoomListItem(item)).toList(),
            ))
          ],
        ),
      ),
    );
  }

}
