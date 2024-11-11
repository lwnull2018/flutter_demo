
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('主页'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('主页', style: TextStyle(fontSize: 30, color: Colors.teal),),
            ElevatedButton(
                onPressed: (){
                  Get.back();
                },
                child: const Text('返回上一级')
            )
          ],
        ),
      ),
    );
  }

}
