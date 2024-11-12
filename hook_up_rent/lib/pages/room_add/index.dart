import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_floating_button.dart';
import 'package:hook_up_rent/widgets/common_radio_form_item.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/common_formt_item.dart';
import '../../widgets/common_image_picker.dart';
import '../../widgets/common_select_form_item.dart';
import '../../widgets/common_title.dart';
import '../../widgets/room_appliance.dart';

class RoomAddPage extends StatefulWidget {
  const RoomAddPage({super.key});

  @override
  State<RoomAddPage> createState() => _RoomAddPageState();
}

class _RoomAddPageState extends State<RoomAddPage> {
  int roomType = 0;
  int floor = 0;
  int orentiedType = 0;
  List<XFile> files = [];
  int rentType = 0; //合租类型
  int decorationType = 0; //装修类型

  var titleController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('房源发布'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingButton('提交', () {}),
      body: ListView(
        children: [
          CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/search');
                  },
                  behavior: HitTestBehavior.translucent, //设置点击空白区域也生效
                  child: Container(
                    height: 40.0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '请选择小区',
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          CommonFormItem(label: '租金', hitText: '请输入租金', suffixText: '元/月'),
          CommonFormItem(label: '大小', hitText: '请输入房屋大小', suffixText: '平方米'),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            options: const ['一室', '二室', '三室', '四室'],
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            options: const ['高楼层', '中楼层', '低楼层'],
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
          ),
          CommonSelectFormItem(
              label: '朝向',
              options: const ['东', '南', '西', '北'],
              value: orentiedType,
              onChange: (val) {
                setState(() {
                  orentiedType = val;
                });
              }),
          CommonRadioFormItem(
              label: '租赁方式',
              options: const ['合租', '整租'],
              value: rentType,
              onChange: (index) {
                setState(() {
                  rentType = index;
                });
              }),
          CommonRadioFormItem(
              label: '装修',
              options: const ['精装', '简装'],
              value: decorationType,
              onChange: (index) {
                setState(() {
                  decorationType = index;
                });
              }),
          CommonTitle('房源头像'),
          CommonImagePicker(onChange: (List<XFile> files) {
            files = files;
          }),
          CommonTitle('房源标题'),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入标题，例如（整租，精装，小区名，2室）',
              ),
            ),
          ),
          CommonTitle('房源配置'),
          RoomAppliance(onChange: (context){}),
          CommonTitle('房源描述'),
          Container(
            margin: EdgeInsets.only(bottom: 150.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              maxLines: 10,
              controller: descController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: '请输入房屋描述',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
