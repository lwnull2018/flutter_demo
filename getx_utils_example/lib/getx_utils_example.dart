import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class GetXUtilsExample extends StatelessWidget {

  var textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetXUtils 使用示例'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //输入框
            Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                    controller: textEditingController
                )
            ),
            //按钮
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if(GetUtils.isEmail(textEditingController.text)) {
                      Get.snackbar(
                          "正确",
                          "恭喜您，完全正确",
                          backgroundColor: Colors.greenAccent
                      );
                  } else {
                      Get.snackbar(
                          "邮箱错误",
                          "请输入正确的邮箱",
                          backgroundColor: Colors.pink
                      );
                  }
                },
                child: const Text('判断是否是邮箱'),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: ()  {
                    if(GetUtils.isPhoneNumber(textEditingController.text)) {
                      Get.snackbar(
                          '正确',
                          '恭喜您，完全正确',
                          backgroundColor: Colors.greenAccent
                      );
                    } else {
                      Get.snackbar(
                          '手机号码错误',
                          '请输入正确的手机号码',
                          backgroundColor: Colors.redAccent
                      );
                    }
                  },
                  child: const Text('判断是否手机号码'),
                ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () async {
                    if(GetUtils.isIPv4(textEditingController.text)) {
                      Get.snackbar(
                          '正确',
                          '恭喜您，完全正确',
                          backgroundColor: Colors.greenAccent
                      );
                    } else {
                      Get.snackbar(
                          'IP错误',
                          '请输入正确的IP',
                          backgroundColor: Colors.redAccent
                      );
                    }
                  },
                  child: const Text('判断是否IPv4'),
                ),
            ),

          ],
        ),
      ),
    );
  }

}
