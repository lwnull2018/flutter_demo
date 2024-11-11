import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObsCountExample extends StatelessWidget {

  //Obx变量的三种定义方式
  // RxInt count = RxInt(0);
  // var count = Rx<double>(0);
  var count = 0.obs;

  void increment() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX Obs -- 计数器'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //使用Obx监听值的改变，有监听到值的改变，它会刷新界面
            Obx(() => Text('count的值为: $count', style: const TextStyle(fontSize: 30, color: Colors.lightBlue),),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  increment();
                },
                child: const Text('点我加1')
            )
          ],
        ),
      ),
    );
  }

}
