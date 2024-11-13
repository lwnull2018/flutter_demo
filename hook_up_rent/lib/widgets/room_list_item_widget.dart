import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import '../pages/home/tab_search/data_list.dart';
import 'common_tag.dart';

class RoomListItem extends StatelessWidget {

  final RoomListItemData data;

  const RoomListItem(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/roomDetail', arguments: {'id':data.id});
        },
        child: Row(
          children: [
            CommonImage(src: data.imageUrl, width: 132.5, height: 100.0,),
            const Padding(padding: EdgeInsets.only(left: 10.0)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                  Text(
                    data.subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                  Wrap(children: data.tags.map((e) => CommonTag(e)).toList(),),
                  Text('${data.price}元/每月', style: TextStyle(color: Colors.orange, fontSize: 16.0, fontWeight: FontWeight.w600),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
