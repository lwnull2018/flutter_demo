import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //层叠样式 - 两个组件，一个是头像框、一个是文本区域
  var stack = Stack(
    alignment: const FractionalOffset(0.5, 0.8),
    children: [
    const CircleAvatar(
      backgroundImage: NetworkImage(''),
      radius: 100,
    ),
    Container(
      decoration: const BoxDecoration(
          color: Colors.lightBlue
      ),
      padding: const EdgeInsets.all(5.0),
      child: const Text('技术老新手'),
    )
  ],);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo ',
        // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
        home: Scaffold(
            appBar: AppBar(title: Text('Stack Widget 层叠布局')),
            body: Center(child: stack )
        )
    );
  }
}

