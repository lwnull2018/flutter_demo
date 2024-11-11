import 'package:flutter/material.dart';

import '../../../widgets/common_image.dart';
import 'index_recommend_data.dart';

class IndexRecommendItemWidget extends StatelessWidget {
  final IndexRecommendItem? data;

  const IndexRecommendItemWidget(this.data, {super.key});


  @override
  Widget build(BuildContext context) {

    var textStyle = const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(data!.navigateUrl);
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: (MediaQuery.of(context).size.width-10*3)/2,
        height: 80,
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Text(data!.title, style: textStyle,),
              Text(data!.subTitle, style: textStyle,),
            ]),
            Column(
              children: [
                CommonImage(src: data!.imageUrl, width: 55.0,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
