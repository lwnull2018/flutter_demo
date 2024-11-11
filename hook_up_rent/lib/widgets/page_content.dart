//1.创建 /widgets/page_content.dart
//2.添加 material.dart依赖
import 'package:flutter/material.dart';

import '../routes.dart';

//3.编写无状态组件
class PageContent extends StatelessWidget {

  //4.添加 name 参数
  final String name;

  const PageContent({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    //5. 构建 Scaffold
    return Scaffold(
      appBar: AppBar(title:  Text('当前页面：$name'),),
      body: ListView(
        children: [
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.home);
          }, child: Text(Routes.home)),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.register);
          }, child: Text(Routes.register)),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, Routes.login);
          }, child: Text(Routes.login)),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/hahaha');
          }, child: const Text('不存在的页面')),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, '/room', arguments: {'id': 2233});
          }, child: const Text('房屋详情面')),
        ],
      ),
    );
  }

}
