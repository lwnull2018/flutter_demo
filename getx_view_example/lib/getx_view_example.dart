
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'getview_controller.dart';

//继承自GetView，而不再是Stateless
//适用于只依赖一个控制器的情况
class GetViewAndGetWidgetExample extends GetView<GetViewController> {

  @override
  Widget build(BuildContext context) {

    //需要注册控制器
    Get.put(GetViewController());

    return Scaffold(
      appBar: AppBar(title: const Text('GetView示例'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => Text(
                'count值：${controller.count}',
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 26
                ),
            )),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  controller.increment();
                },
                child: const Text('加1+')
            ),
          ],
        ),
      ),
    );
  }


}