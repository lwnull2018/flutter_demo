import 'package:flutter/material.dart';
import 'package:getx_demo_2/internationalization_controller.dart';
import 'package:get/get.dart';

class InternationalizationExample extends StatelessWidget {

  var internationalizationController = Get.put(InternationalizationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX -- 国际化示例'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //文本中的值要跟国际化中配置的对应上
            Text('hello'.tr, style: const TextStyle(fontSize: 30, color: Colors.lightBlue),),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  internationalizationController.changeLanguage('zh', 'CN');
                },
                child: const Text('切换到中文')
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                  internationalizationController.changeLanguage('en', 'US');
                },
                child: const Text('切换到英文')
            ),
          ],
        ),
      ),
    );
  }

}
