import 'package:flutter/material.dart';
import 'package:hook_up_rent/scope_model/room_filter.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_title.dart';

import 'data.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;

    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    //更新ScopedModel里的值
    _onChange(String val) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedToggleItem(val);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const CommonTitle('户型'),
            FilterDrawerItem(
              list: dataList['roomTypeList']!,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            const CommonTitle('朝向'),
            FilterDrawerItem(
              list: dataList['orientedList']!,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            const CommonTitle('楼层'),
            FilterDrawerItem(
              list: dataList['floorList']!,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawerItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawerItem(
      {super.key,
      required this.list,
      required this.selectedIds,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);
          return GestureDetector(
            onTap: () {
              onChange(item.id);
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              width: 100.0,
              height: 40.0,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.0, color: Theme.of(context).primaryColor),
                  color: isActive ? Colors.green : Colors.white),
              child: Center(
                  child: Text(
                item.name,
                style: TextStyle(color: isActive ? Colors.white : Colors.black),
              )),
            ),
          );
        }).toList(),
      ),
    );
  }
}
