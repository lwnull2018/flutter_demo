
import 'package:flutter/cupertino.dart';

class IndexNavigatorItem {
  late String title;
  late String imgUrl;
  late Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title, this.imgUrl, this.onTap);

}

 List<IndexNavigatorItem>  navigatorItemList = [

  IndexNavigatorItem('整组', 'static/images/home_index_navigator_total.png', (BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }),

  IndexNavigatorItem('合租', 'static/images/home_index_navigator_share.png', (BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }),

  IndexNavigatorItem('地图找房', 'static/images/home_index_navigator_map.png', (BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }),

  IndexNavigatorItem('去出租', 'static/images/home_index_navigator_rent.png', (BuildContext context) {
    Navigator.of(context).pushNamed('/login');
  }),

];