import 'package:flutter/material.dart';

import '../../../widgets/common_image.dart';
import 'index_navigator_item.dart';

class IndexNavigator extends StatefulWidget {
  const IndexNavigator({super.key});

  @override
  State<IndexNavigator> createState() => _IndexNavigatorState();
}

class _IndexNavigatorState extends State<IndexNavigator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: navigatorItemList
            .map((item) => InkWell(
                  onTap: () {
                    item.onTap(context);
                  },
                  child: Column(
                    children: [
                      CommonImage(
                        src: item.imgUrl,
                        width: 47.5,
                      ),
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
