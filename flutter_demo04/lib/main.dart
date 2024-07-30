import 'package:flutter/material.dart';
import 'frosted_glass_demo.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '磨砂玻璃效果',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: const Scaffold(
        body: FrostedGlassDemo(),
      ),
    );
  }

}
