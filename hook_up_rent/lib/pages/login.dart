//1.新建 /pages/home/index.dart
//2.添加 material、 page_content 依赖
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/utils/store.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';

import '../scope_model/auth.dart';

//3.编写无状态组件

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  _loginHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    if(stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名密码不能为空');
      return;
    }
    var url = '/user/login';
    var param = {
      'username': username,
      'password': password,
    };

    var res = await DioHttp.of(context).post(url, param);
    print('登录 res:$res');
    var resMap = json.decode(res.toString());
    int status = resMap['status'];
    String description = resMap['description']??'内部错误';
    if(status.toString().startsWith('2')) {
      CommonToast.showToast(description);
      //拿到token
      String token = resMap['body']['token']??'';
      Store store = await Store.getInstance();
      //设置缓存
      await store.setString(StoreKeys.token, token);
      //设置中间件ScopedModel，通知所有订阅者：用户已登录
      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);

      //1秒之后返回上一个页面
      Timer(const Duration(seconds: 1), (){
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //4.使用 PageContent
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          '登 陆',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: passwordController,
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                suffixIcon: IconButton(
                  icon: Icon(
                      showPassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  _loginHandler();
                },
                child: const Text(
                  '登陆',
                  style: TextStyle(color: Colors.white),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('还没有账号，'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    child: const Text(
                      '去注册~',
                      style: TextStyle(color: Colors.green),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
