import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_check_button.dart';

import '../config.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);

// const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

class RoomAppliance extends StatefulWidget {
  //组件参数
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({super.key, required this.onChange});

  @override
  State<RoomAppliance> createState() => _RoomApplianceState();

}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        runSpacing: 30.0,//两行之间的间距
        children: list
            .map((item) => GestureDetector(
                  onTap: () {
                    setState(() {
                      list = list
                          .map((innerItem) => innerItem == item
                              ? RoomApplianceItem(
                                  item.title, item.iconPoint, !item.isChecked)
                              : innerItem)
                          .toList();
                    });
                    //同时通知父级
                    if(null != widget.onChange) {
                      widget.onChange(list);
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Column(
                      children: [
                        Icon(
                          //字体图标的使用
                          IconData(item.iconPoint,
                              fontFamily: Config.CommonIcon),
                          size: 40.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(item.title),
                        ),
                        CommonCheckButton(item.isChecked),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

//房屋配置组件
class RoomApplianceList extends StatelessWidget {

  final List<String>? list;

  const RoomApplianceList(this.list, {super.key});

  @override
  Widget build(BuildContext context) {
    var showList = _dataList.where((item) => list!.contains(item.title)).toList();
    if(showList.isEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 10.0),
        child: const Text('暂时没有房屋配置信息'),
      );
    }
    return Container(
      child: Wrap(
        runSpacing: 30.0,//两行之间的间距
        children: showList
            .map((item) => Container(
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              children: [
                Icon(
                  //字体图标的使用
                  IconData(item.iconPoint,
                      fontFamily: Config.CommonIcon),
                  size: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(item.title),
                ),
              ],
            ),
          ),
        )
            .toList(),
      ),
    );
  }

}
