import 'package:flutter/material.dart';
import 'search_bar_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '不简单搜索条',
      theme: ThemeData.light(),
      home: const SearchBarDemo(),
    );
  }
}
