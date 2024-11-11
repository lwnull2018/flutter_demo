import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/binding_home_controller.dart';

class GetxBindingExample extends StatelessWidget {
  const GetxBindingExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Getx -- Binding '),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=> Text('计数器值：${Get.find<BindingHomeController>().count}', style: const TextStyle(color: Colors.redAccent, fontSize: 25),),),
            ElevatedButton(
                onPressed: (){
                  Get.find<BindingHomeController>().increment();
                },
                child: const Text('加1+')),

          ],
        ),
      ),
    );
  }

}
