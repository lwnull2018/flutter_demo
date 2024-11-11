
import 'package:flutter/cupertino.dart';
import 'package:state_manger/tapbox_widgetc.dart';

/*
 * 父组件：负责管理 _active 状态值
 */
class ParentWidgetC extends StatefulWidget {

  const ParentWidgetC({super.key});

  @override
  State<ParentWidgetC> createState() => _ParentWidgetCState();

}

class _ParentWidgetCState extends State<ParentWidgetC> {

  bool _active = false;

  void onChange(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(active: _active, onChanged: onChange, ),
    );
  }

}
