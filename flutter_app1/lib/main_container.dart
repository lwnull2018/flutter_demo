import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 123',
      // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome ---- tContainer')
        ),
        body: Center(
          child: Container(//相当于 div
            child: new Text( 'Hello Flutter 123 567 中文的世界里，我愿意为前端事业奋斗一生，包括上半身，也包括下半身，侃侃，哈哈，呵呵～～～', style: TextStyle(fontSize: 25.0),),
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 400.0,
            // color: Colors.lightBlue,
            padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: new BoxDecoration(//渐变色
              gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]),
              border: Border.all(width: 5, color: Colors.red)
            ),
          ),
        ),
      )
    );
  }
}

