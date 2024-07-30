import 'package:flutter/material.dart';

class WrapDemo extends StatefulWidget {
  const WrapDemo({super.key});

  @override
  State<WrapDemo> createState() => _WrapDemoState();
}

class _WrapDemoState extends State<WrapDemo> {

  late List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    list.add(buildAddButton());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap流式布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
            width: width,
            height: height / 2,
            color: Colors.grey,
            child: Wrap(
              spacing: 26.0,
              children: list,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton() {
    return GestureDetector(
      onTap: (){
        if(list.length < 12) {
          //触发事件时，需要改变状态
          setState(() {
            list.insert(list.length - 1, buildPhoto());
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.black54,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget buildPhoto() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80.0,
          height: 80.0,
          color: Colors.amber,
          child: const Center(child: Text('照片')),
        ),
    );
  }

}
