import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //层叠样式 三个层叠样式布局
  var stack = const Stack(
    alignment: FractionalOffset(0.5, 0.8),
    children: [
    CircleAvatar(
      backgroundImage: NetworkImage('https://pica.zhimg.com/80/v2-bc95c6922c90e07cc6e006d20142bc22.jpg'),
      radius: 100,
    ),
      Positioned(
        top: 10,
          left: 60,
          child: Text('baidu.com')
      ),
      Positioned(
        bottom: 10,
        right: 60,
        child: Text('google.com')
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

