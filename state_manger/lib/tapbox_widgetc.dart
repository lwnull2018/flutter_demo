
import 'package:flutter/material.dart';

class TapboxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxC({super.key, required this.active, required this.onChanged});

  @override
  State<TapboxC> createState() => _TapboxCState();

}
/*
 * 子组件：管理 _highlight 状态；active 传回父组件，由父组件管理
 * 当状态值改变时调用 setState() 更新UI
 */
class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    //回传状态值给父组件
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    print('tapboxc build...');
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return GestureDetector(
      onTapDown: _handleTapDown, //按下事件
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: Container(
        width: 100.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ?
              Border.all(
                color: Colors.teal,
                width: 10.0)
              : null,
        ),
        child: Center(
          child: Text(
            widget.active? 'Active' : 'Inactive',
            style: const TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),

    );
  }

}
