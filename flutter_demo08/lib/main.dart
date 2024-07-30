import 'package:flutter/material.dart';
import 'expansion_tile.dart';
import 'expansion_panel_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '展开闭合',
      theme: ThemeData.light(),
      // home: const ExpansionTileDemo() //单个的
      home: const ExpansionPanelListDemo() //列表
    );
  }

}
