import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_2/my_lifecycle_controller.dart';

import 'home.dart';

class GetXLifeCycleExample extends StatelessWidget {

  var myLifeCycleController = Get.put(MyLifeCycleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX -- 生命周期示例'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<MyLifeCycleController>(
                initState: (data) => myLifeCycleController.increment(),
                dispose: (_) => myLifeCycleController.cleanTask(),
                builder: (controller) {
                  return Text('计数器的值为：${myLifeCycleController.count.value}', style: const TextStyle(fontSize: 30, color: Colors.lightBlue),);
                }),
            ElevatedButton(onPressed: (){
              Get.to(() => const Home());
            }, child: const Text('跳转', style: TextStyle(fontSize: 20),)),
          ],
        ),
      ),
    );
  }

}
