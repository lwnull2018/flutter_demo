import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';

import '../scope_model/auth.dart';
import '../utils/common_toast.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置'),),
      body: ListView(
        children: [
          ElevatedButton(onPressed: (){
            ScopedModelHelper.getModel<AuthModel>(context).logout();
            CommonToast.showToast('您已退出登陆');
            Navigator.of(context).pop();
          },
          child: const Text('退出登陆', style: TextStyle(color: Colors.red),)
          )
        ],
      ),
    );
  }
}
