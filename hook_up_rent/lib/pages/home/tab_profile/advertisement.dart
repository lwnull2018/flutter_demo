import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

//https://pic6.ajkimg.com/news/7773251c3a23a33a2d6d4c521ae53c43?imageMogr2/format/png/thumbnail
//广告区
class Advertisement extends StatelessWidget {
  const Advertisement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, top: 30.0, right: 10.0, bottom: 20.0),
      child: CommonImage(src: "https://pic6.ajkimg.com/news/7773251c3a23a33a2d6d4c521ae53c43?imageMogr2/format/png/thumbnail",),
    );
  }
}
