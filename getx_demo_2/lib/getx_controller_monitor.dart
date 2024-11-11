import 'package:flutter/material.dart';
import 'package:getx_demo_2/monitor_controller.dart';
import 'package:get/get.dart';

//事件监听示例
class GetXControllerMonitorExample extends StatelessWidget {

  MonitorController monitorController = Get.put(MonitorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Getx -- 事件监听'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(()=> Text('当前值：${monitorController.count}', style: const TextStyle(color: Colors.lightBlue, fontSize: 30),),),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  monitorController.increment();
                },
                child: const Text('增加+1', style: TextStyle(fontSize: 20),)
            ),
            Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  onChanged: (val) {
                    monitorController.increment();
                  },
                ),
            )
          ],
        ),
      ),
    );
  }

}
