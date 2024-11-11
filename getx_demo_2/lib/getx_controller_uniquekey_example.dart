import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getx_unique_controller.dart';

class GetXControllerUniqueKeyExample extends StatelessWidget {

  var uniqueController =  Get.put(GetXUniqueController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX -- Unique Key 示例'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<GetXUniqueController>(
                id: 'my_count_1',
                builder: (controller) {
                return Text(
                  '计算器的值1：${uniqueController.count.value}',
                  style: const TextStyle(fontSize: 30, color: Colors.redAccent),);
            }),
            GetBuilder<GetXUniqueController>(
                id: 'my_count',
                builder: (controller) {
                return Text(
                  '计算器的值2：${uniqueController.count.value}',
                  style: const TextStyle(fontSize: 30, color: Colors.lightBlue),);
            }),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  uniqueController.increment();
                },
                child: const Text('增加')
            ),
          ],
        ),
      ),
    );
  }

}
