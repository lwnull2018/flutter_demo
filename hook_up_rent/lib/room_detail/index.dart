import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';
import 'package:hook_up_rent/widgets/common_swipper.dart';
import 'package:hook_up_rent/widgets/common_tag.dart';
import 'package:hook_up_rent/widgets/common_title.dart';
import 'package:share/share.dart';

import '../widgets/room_appliance.dart';
import 'data.dart';

var bottomButtonStyle = const TextStyle(color: Colors.white, fontSize: 20.0);

class RoomDetailPage extends StatefulWidget {
  final String roomId;

  const RoomDetailPage({super.key, required this.roomId});

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData? data;
  bool isLike = false;
  bool showAllText = false;
  bool showTextTool = false;

  @override
  void initState() {
    data = defaultData;
  }

  @override
  Widget build(BuildContext context) {
    if (null == data) return Container();
    showTextTool = data!.subTitle!.length > 100;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Share.share('https://www.itcast.cn');
              },
              icon: const Icon(Icons.share))
        ],
        title: Text('${data?.title}'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              CommonSwipper(),
              CommonTitle('${data?.title}'),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${data?.price}',
                      style:
                          const TextStyle(color: Colors.pink, fontSize: 20.0),
                    ),
                    const Text(
                      '元/月(押一付三)',
                      style: TextStyle(color: Colors.pink, fontSize: 16.0),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Wrap(
                  spacing: 4.0,
                  children: data!.tags!.map((item) => CommonTag(item)).toList(),
                ),
              ),
              const Divider(
                color: Colors.grey,
                indent: 20.0,
                endIndent: 20.0,
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                child: Wrap(
                  runSpacing: 10.0,
                  children: [
                    BaseInfoItem(content: '面积: ${data?.size}平米'),
                    BaseInfoItem(content: '楼层: ${data?.floor}'),
                    BaseInfoItem(content: '房型: ${data?.roomType}'),
                    const BaseInfoItem(content: '装修: 精装'),
                  ],
                ),
              ),
              CommonTitle('房屋配置'),
              RoomApplianceList(data!.applicances),
              CommonTitle('房屋概况'),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data!.subTitle ?? '暂无房屋概况', maxLines: showAllText? null: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showAllText = !showAllText;
                                    print('showAllText:${showAllText}');
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(showAllText ? '收起' : '展开'),
                                    Icon(showAllText
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down),
                                  ],
                                ),
                              )
                            : Container(),
                        Text('举报'),
                      ],
                    ),
                  ],
                ),
              ),
              CommonTitle('猜你喜欢'),
              Info(),
              Container(
                height: 80.0,
              )
            ],
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 0.0,
            left: 0.0,
            height: 100.0,
            child: Container(
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLike = !isLike;
                        print('isLike=${isLike}');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      height: 50.0,
                      width: 40.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            isLike ? Icons.star : Icons.star_border_outlined,
                            color: isLike ? Colors.green : Colors.black87,
                            size: 24.0,
                          ),
                          Text(
                            isLike ? '已收藏' : '收藏',
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0, bottom: 5.0),
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(4.0)),
                      child:
                          Center(child: Text('联系房东', style: bottomButtonStyle)),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 10.0, bottom: 5.0),
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.lightGreen,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: Center(
                          child: Text(
                        '预约看房',
                        style: bottomButtonStyle,
                      )),
                    ),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//信息展示基础组件
class BaseInfoItem extends StatelessWidget {
  final String content;

  const BaseInfoItem({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 3 * 10) / 2,
      child: Text(content),
    );
  }
}
