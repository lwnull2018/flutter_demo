import 'package:flutter/material.dart';

class CommonTag extends StatelessWidget {

  final String title;
  final Color color;
  final Color backgroundColor;

  const CommonTag.origin(this.title, {super.key, this.color=Colors.black, this.backgroundColor=Colors.grey});

  //工厂方法，根据不同的title返回不同样式tag
  factory CommonTag(String title) {
    switch(title) {
      case '近地铁' :
        return CommonTag.origin(title, color:Colors.red, backgroundColor: Colors.red.shade50,);
      case '集中供暖' :
        return CommonTag.origin(title, color:Colors.blue, backgroundColor: Colors.blue.shade50,);
      case '随时看房' :
        return CommonTag.origin(title, color:Colors.green, backgroundColor: Colors.green.shade50,);
      case '新上' :
        return CommonTag.origin(title, color:Colors.red, backgroundColor: Colors.red.shade50,);
      default:
        return CommonTag.origin(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
      margin: EdgeInsets.only(left: 4.0),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8.0)
      ),
      child: Text(title, style: TextStyle(color: color, fontSize: 10.0),),
    );
  }

}
