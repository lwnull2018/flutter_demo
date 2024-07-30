import 'package:flutter/material.dart';
import 'bottom_appbar_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo 底部不规则工具栏',
      //自定义主题样本
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: const BottomAppBarWidget(),
    );
  }
}


