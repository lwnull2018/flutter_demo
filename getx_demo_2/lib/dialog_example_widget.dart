import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog title')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.defaultDialog(
                      title: '是否删除?',
                      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
                      middleText: '确认删除选中的数据吗？',
                      middleTextStyle: const TextStyle(fontSize: 18, color: Colors.redAccent),
                      barrierDismissible: true,//点击其他地方是否可关闭弹窗，默认为true
                      textCancel: '取消',
                      textConfirm: '确认',
                      buttonColor: Colors.redAccent,
                      radius: 20.0,
                      onConfirm: () {
                          print('确认按钮');
                          Get.back();
                      },
                      onCancel: () {
                        print('取消按钮');
                        Get.back();
                      }
                  );
                },
                child: const Text('显示Dialog')
            )
          ],
        ),
      ),
    );
  }

}
