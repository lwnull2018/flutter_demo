import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';

import '../models/community.dart';
import '../widgets/search_bar/index.dart';

//小区选择器
class CommunityPickerPage extends StatefulWidget {
  const CommunityPickerPage({super.key});

  @override
  State<CommunityPickerPage> createState() => _CommunityPickerPageState();
}

class _CommunityPickerPageState extends State<CommunityPickerPage> {
  List<Community> dataList = [];

  _searchSubmit(String val) async {
    print('value:$val');
    var areaId = ScopedModelHelper.getAreaId(context);
    final url = '/area/community?name=$val&id=$areaId';
    var result = await DioHttp.of(context).get3(url);
    var resMap = json.decode(result.toString())['body'];
    List<Community> resList =
        List<Community>.from(resMap.map((item) => Community.fromJson(item)))
            .toList();

    setState(() {
      dataList = resList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //去掉自带的返回按钮
        title: SearchBarWidget(
          onCancel: () {
            Navigator.of(context).pop();
          },
          goBackCallback: () {
            Navigator.of(context).pop();
          },
          onSearchSubmit: _searchSubmit,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: ListView.separated(
          //分隔列表
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                //回传选中数据
                Navigator.of(context).pop(dataList[index]);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(dataList[index].name),
              ),
            );
          },
          //分隔符
          separatorBuilder: (_context, _) => const Divider(),
        ),
      ),
    );
  }
}
