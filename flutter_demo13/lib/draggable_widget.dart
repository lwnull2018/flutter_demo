import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {

  final Offset offset;
  final Color widgetColor;

  const DraggableWidget(this.offset, this.widgetColor);


  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();

}

class _DraggableWidgetState extends State<DraggableWidget> {

  Offset offset = const Offset(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    offset = widget.offset;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: offset.dx,
        top: offset.dy,
        child: Draggable(
          data: widget.widgetColor,//传递颜色
          feedback: Container(//拖拽时子元素的变化
            width: 110.0,
            height: 110.0,
            color: widget.widgetColor.withOpacity(0.5),
          ),
          onDraggableCanceled: (Velocity velocity, Offset offset) {
            setState(() {
              this.offset = offset;
            });
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            color: widget.widgetColor,
          ),
        )
    );
  }

}

