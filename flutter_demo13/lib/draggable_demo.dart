import 'package:flutter/material.dart';
import 'draggable_widget.dart';

class DraggableDemo extends StatefulWidget {
  const DraggableDemo({super.key});

  @override
  State<DraggableDemo> createState() => _DraggableDemoState();
}

class _DraggableDemoState extends State<DraggableDemo> {

  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DraggableWidget(Offset(120.0, 180.0), Colors.tealAccent),
          const DraggableWidget(Offset(240.0, 180.0), Colors.pinkAccent),
          Center(
             child: DragTarget(
               builder: (context, candidateData, rejectData) {
                  return Container(
                    width: 200.0,
                    height: 200.0,
                    color: _draggableColor,
                  );
                },
               onAccept: (Color color) {
                   _draggableColor = color;
               },
             ),
          )
        ],
      ),
    );
  }

}
