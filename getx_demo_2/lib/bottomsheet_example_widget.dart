import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomSheet Title'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.bottomSheet(
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.wb_sunny_outlined),
                            title: const Text('白天模式', style: TextStyle(color: Colors.white),),
                            onTap: (){
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.wb_sunny),
                            title: const Text('夜晚模式'),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                            },
                          )
                        ],
                      ),
                    ),
                    backgroundColor: Colors.teal,
                    barrierColor: Colors.transparent, // 弹出层的背景色
                    enterBottomSheetDuration: const Duration(seconds: 1),//进入时间
                    exitBottomSheetDuration: const Duration(seconds: 1),//退出时间
                  );
                },
                child: const Text('显示BottomSheet')),
          ],
        ),
      ),
    );
  }

}
