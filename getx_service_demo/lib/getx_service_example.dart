import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './service.dart';

class GetXServiceExample extends StatelessWidget {
  const GetXServiceExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Service 示例'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.find<Service>().getCounter();
                },
                child: const Text('点我+1', style: TextStyle(fontSize: 20, color: Colors.lightBlue),)
            )
          ],
        ),
      ),
    );
  }

}
