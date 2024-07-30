import 'package:flutter/material.dart';
import 'pages.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //自定义主题样式
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const FirstPage(),
    );
  }
}
