import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/index.dart';

import '../../../widgets/room_list_item_widget.dart';
import 'data_list.dart';
import 'package:hook_up_rent/widgets/search_bar/index.dart';
import 'package:hook_up_rent/scope_model/room_filter.dart';

import 'filter_bar/data.dart';
import 'filter_bar/filter_drawer.dart';

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
      endDrawer: const FilterDrawer(),
      appBar: AppBar(
        title: SearchBarWidget(
          shwoLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed('/search');
          },
        ),
        actions: [
          Container()
        ], //给一个空的actions，目的是替换掉 endDrawer 的图标,然后 Drawer效果就要通过左拉的方式
      ),
      body: Column(
        children: [
          SizedBox(
              height: 41.0,
              child: FilterBar(
                onChange: (FilterBarResult value) {},
              )),
          Expanded(
              child: ListView(
            children: dataList.map((item) => RoomListItem(item)).toList(),
          ))
        ],
      ),
    );
  }
}
