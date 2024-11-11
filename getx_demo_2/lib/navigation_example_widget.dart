import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

//调用to()方法进行路由跳转
class NavigationExample extends StatelessWidget {
  const NavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Navigation'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.to(const Home());
                },
                child: const Text('跳转到首页')
            )
          ],
        ),
      ),
    );
  }

}
