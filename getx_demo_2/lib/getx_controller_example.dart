import 'package:flutter/material.dart';
import 'package:getx_demo_2/my_controller.dart';
import 'package:get/get.dart';

class GetXControllerExample extends StatelessWidget {

  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX--controller'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //第一种
            /*Obx(()=> Text(
              '我叫 ${myController.teacher.name}',
                style: const TextStyle(color: Colors.lightBlue, fontSize: 30),
            )),*/
            //第二种
            /*GetX<MyController>(
                init: MyController(),
                builder: (controller) {
                  return Text(
                      '我叫 ${controller.teacher.value.name}',
                      style: const TextStyle(color: Colors.lightBlue, fontSize: 30),
                  );
                }
            ),*/
            //第三种
            GetBuilder<MyController>(
                init: myController,
                builder: (controller) {
                  return Text(
                      '我叫 ${controller.teacher.name}',
                      style: const TextStyle(color: Colors.lightBlue, fontSize: 30),
                  );
                }
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  myController.convertToUpperCase();
                },
                child: const Text('转化成大写'))
          ],
        ),
      ),
    );
  }

}
