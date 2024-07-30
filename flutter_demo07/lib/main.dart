import 'package:flutter/material.dart';
import 'wrap_demo.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '流式布局',
      theme: ThemeData.light(),
      home: WrapDemo(),
    );
  }

}

