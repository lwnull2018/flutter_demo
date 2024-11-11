import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo_2/teacher.dart';

//自定义类的案例
class ObxCustomClassExample extends StatelessWidget {

  //第一种
  var teacher = Teacher();

  //第二种
  // var teacher = Teacher('Chen', 20).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Obx -- 自定义类'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=> Text('我的名字是：${teacher.name.value}', style: const TextStyle(fontSize: 30, color: Colors.lightBlue),)),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              teacher.name.value = teacher.name.value.toUpperCase();
              /*teacher.update((val) {
                  teacher.value.name = teacher.value.name.toString().toUpperCase();
                }
              );*/
            }, child: const Text('转换成大写')),
          ],
        ),
      ),
    );
  }

}
