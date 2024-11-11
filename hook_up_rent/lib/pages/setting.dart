import 'package:flutter/material.dart';

import '../utils/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置'),),
      body: Container(
        child: ListView(
          children: [
            ElevatedButton(onPressed: (){
              CommonToast.showToast('您已退出登陆');
            },
            child: const Text('退出登陆', style: TextStyle(color: Colors.red),)
            )
          ],
        ),
      ),
    );
  }
}
