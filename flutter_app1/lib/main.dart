import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: '本地图片引用',
    home: MyApp(),
  ));
}

//pubspec.yaml 文件中要配置相应的图片路径
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('本地图片引用')),
      body: Image.asset('images/ai_qq.jpeg'),
    );
  }
}


