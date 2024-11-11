import 'package:flutter/material.dart';

import 'index_recommend_data.dart';
import 'index_recommend_item_widget.dart';

//推荐栏组件
class IndexRecommend extends StatelessWidget {

  final List<IndexRecommendItem> dataList;

  const IndexRecommend({super.key,  this.dataList = indexRecommendData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Color(0x08000000),),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('房屋推荐', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
              Text('更多', style: TextStyle(fontWeight: FontWeight.w300, color: Colors.black54),),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Wrap(
            spacing: 10.0,//每个item之间的间距
            runSpacing: 10.0,//每行之间的间距
            children: dataList.map((item) => IndexRecommendItemWidget(item)).toList(),
          )
        ],
      ),
    );
  }

}
