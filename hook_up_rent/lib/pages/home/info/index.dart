import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'item_widget.dart';

class Info extends StatelessWidget {

  final bool showTitle;
  final  List<InfoItem> data;

  const Info({super.key, this.showTitle=false, this.data=infoData});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Visibility(
            visible: showTitle,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10.0),
              child: const Text('最新资讯', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
            ),
          ),
          Column(
            children: data.map((item) => ItemWidget(item)).toList(),
          )
        ],
      ),
    );
  }

}
