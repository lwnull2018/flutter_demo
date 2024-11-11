import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 1. SnackBar 使用示例
class SnackBarExample extends StatelessWidget {
  const SnackBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Title'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'SnackBar 标题',
                    '欢迎使用SnackBar',
                    duration: const Duration(seconds: 3),
                    colorText: Colors.pink,
                    snackPosition: SnackPosition.TOP,
                    icon: const Icon(Icons.account_balance),
                    // margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(10),

                  );
                },
                child: const Text('显示SnackBar')
            )
          ],
        ),
      ),
    );
  }

}
