import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/item.dart';
import 'package:hook_up_rent/utils/common_picker/index.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';

import '../../../../scope_model/room_filter.dart';

//过滤栏
class FilterBar extends StatefulWidget {
  ValueChanged<FilterBarResult> onChange;

  FilterBar({super.key, required this.onChange});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  //地区
  _onAreaChange(context) {
    setState(() {
      isAreaActive = true;
    });
    var result = CommonPicker.showPicker(
        context, areaList.map((item) => item.name).toList(), 0);
    result.then((index) {
      if (index == null) return;
      setState(() {
        areaId = areaList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  //筛选 -- 通过代码触发 Drawer打开
  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  //方式
  _onRentTypeChange(context) {
    setState(() {
      isRentTypeActive = true;
    });
    var result = CommonPicker.showPicker(
        context, rentTypeList.map((item) => item.name).toList(), 0);
    result.then((index) {
      if (index == null) return;
      setState(() {
        rentTypeId = areaList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
  }

  //租金
  _onPriceChange(context) {
    setState(() {
      isPriceActive = true;
    });
    var result = CommonPicker.showPicker(
        context, priceList.map((item) => item.name).toList(), 0);
    result.then((index) {
      if (index == null) return;
      setState(() {
        priceId = priceList[index].id;
      });
      _onChange();
    }).whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
  }

  //接收更新并通知父级组件的更新方法
  _onChange() {
    //数据有变更时，重新获取变更后数据
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    widget.onChange(FilterBarResult(
        areaId: areaId,
        priceId: priceId,
        rentTypeId: rentTypeId,
        moreIds: selectedList.toList(),
        priceTypeId: '',
        // moreId: selectedList.toList()
    ));
  }

  //初始化数据，设置可选列表数据
  _getData() {
    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    //往ScopedModel里放置数据
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
    return dataList;
  }

  @override
  void initState() {
    super.initState();
    //初始化数据
    // Timer.run(_getData());
  }

  @override
  void didChangeDependencies() {
    _getData();
    super.didChangeDependencies();
    //拿到已选列表数据
    _onChange();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41.0,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black26))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Item(title: '区域', isActive: isAreaActive, onTap: _onAreaChange),
          Item(
              title: '方式',
              isActive: isRentTypeActive,
              onTap: _onRentTypeChange),
          Item(title: '租金', isActive: isPriceActive, onTap: _onPriceChange),
          Item(title: '筛选', isActive: isFilterActive, onTap: _onFilterChange),
        ],
      ),
    );
  }
}
