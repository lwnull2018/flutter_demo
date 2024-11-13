import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import 'data.dart';

class ItemWidget extends StatelessWidget {

  final InfoItem data;

  const ItemWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 12, fontWeight: FontWeight.w300);
    return Container(
      height: 95.0,
      padding: const EdgeInsets.only(left:10.0, right: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/roomDetail', arguments: {'id': "1"});
        },
        child: Row(
          children: [
            CommonImage(src: data.imageUrl, width: 100.0, height: 90.0,),
            const Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.source, style: textStyle,),
                        Text(data.time, style: textStyle,),
                      ],
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

}
