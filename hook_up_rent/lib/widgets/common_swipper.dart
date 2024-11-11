import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'common_image.dart';

const List<String> defaultImages = [
  'https://pic1.ajkimg.com/display/anjuke/b1080e0e44ff69dd1bca4fb6ec8e238b/1125x525n.jpg?sign=e1c21463ae45efd1092d7cf6e6203234&t=1566748800',
  'https://pages.anjukestatic.com/usersite/app/overseas/thailand.png',
  'https://pages.anjukestatic.com/fe/esf/img/f90e6d78/alianqiu-background.jpeg',
  'https://pages.anjukestatic.com/usersite/app/overseas/aus.png',
];
// 图片宽 750px 高 424px
// 设置图片的宽高(为了代码易于阅读)
var imageHeight = 750.0;
var imageWidth = 370.0;

//轮播图组件
class CommonSwipper extends StatefulWidget {
  final List<String> images;

  const CommonSwipper({super.key, this.images = defaultImages});

  @override
  State<CommonSwipper> createState() => _CommonSwipperState();
}

class _CommonSwipperState extends State<CommonSwipper> {
  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.width / imageWidth) * imageHeight;
    return Container(
      height: 200,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return CommonImage(
            src: widget.images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: widget.images.length,
        pagination: const SwiperPagination(),
        // control: SwiperControl(),
      ),
    );
  }
}
