import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';

void main() {
  runApp(const MyApp());
}

//底部导航栏事例
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter bottomNavigationBar',
      theme: ThemeData.light(),
      home: const BottomNavigationWidget(),
    );
  }

}
