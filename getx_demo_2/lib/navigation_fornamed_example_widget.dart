import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationForNamedExample extends StatelessWidget {

  const NavigationForNamedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NavigationForNamed Title'),),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/home');
                },
                child: const Text('跳转到Home')
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed('/my');
                },
                child: const Text('跳转到个人中心')
            ),
          ],
        ),
      ),
    );
  }

}
