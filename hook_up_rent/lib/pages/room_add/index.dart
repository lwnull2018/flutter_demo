import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/models/community.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/upload_images.dart';
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

  Community? community;
  List<File> images = [];

  List<GeneralType> floorList = [];
  List<GeneralType> orentiedList = [];
  List<GeneralType> roomTypeList = [];

  int roomType = 0;
  int floor = 0;
  int orentiedType = 0;
  List<XFile> files = [];
  int rentType = 0; //合租类型
  int decorationType = 0; //装修类型

  var titleController = TextEditingController();
  var descController = TextEditingController();

  _getParams() async {
    String url = '/houses/params';

    //请求后台数据
    var res = await DioHttp.of(context).get3(url);

    var data = json.decode(res.toString())['body'];
    List<GeneralType> floorList = List<GeneralType>.from(
        data['floor'].map((item) => GeneralType.fromJson(item)));

    List<GeneralType> orentiedList = List<GeneralType>.from(
        data['orentied'].map((item) => GeneralType.fromJson(item)));

    List<GeneralType> roomTypeList = List<GeneralType>.from(
        data['roomType'].map((item) => GeneralType.fromJson(item)));

    setState(() {
      this.floorList = floorList;
      this.orentiedList = orentiedList;
      this.roomTypeList = roomTypeList;
    });
  }

  @override
  void initState() {
    Timer.run(_getParams);
    super.initState();
  }

  _submit() async {
    await updateImages(context, files);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('房源发布'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CommonFloatingButton('提交', _submit),
      body: ListView(
        children: [
          const CommonTitle('房源信息'),
          CommonFormItem(
            label: '小区',
            contentBuilder: (context) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/search');
                    var result = Navigator.of(context).pushNamed('/communityPicker');
                    result.then((value) {
                      //拿到返回值
                      if(value!=null) setState(() {
                        community = value! as Community?;
                      });
                    });
                  },
                  behavior: HitTestBehavior.translucent, //设置点击空白区域也生效
                  child: Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          community?.name?? '请选择小区',
                          style: const TextStyle(fontSize: 16.0, color: Colors.black87),
                        ),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const CommonFormItem(label: '租金', hitText: '请输入租金', suffixText: '元/月'),
          const CommonFormItem(label: '大小', hitText: '请输入房屋大小', suffixText: '平方米'),
          CommonSelectFormItem(
            label: '户型',
            value: roomType,
            // options: const ['一室', '二室', '三室', '四室'],
            options: roomTypeList.map((e) => e.name).toList(),
            onChange: (val) {
              setState(() {
                roomType = val;
              });
            },
          ),
          CommonSelectFormItem(
            label: '楼层',
            value: floor,
            // options: const ['高楼层', '中楼层', '低楼层'],
            options: floorList.map((e) => e.name).toList(),
            onChange: (val) {
              setState(() {
                floor = val;
              });
            },
          ),
          CommonSelectFormItem(
              label: '朝向',
              // options: const ['东', '南', '西', '北'],
              options: orentiedList.map((item) => item.name).toList(),
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
          const CommonTitle('房源头像'),
          CommonImagePicker(onChange: (List<XFile> files) {
            files = files;
            // setState(() {
            //   files = files;
            // });
          }),
          const CommonTitle('房源标题'),
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
          const CommonTitle('房源配置'),
          RoomAppliance(onChange: (context) {}),
          const CommonTitle('房源描述'),
          Container(
            margin: const EdgeInsets.only(bottom: 150.0),
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
