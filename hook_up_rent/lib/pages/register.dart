//1.新建 /pages/home/index.dart
import 'dart:convert';

//2.添加 material、 page_content 依赖
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/utils/common_toast.dart';

import '../utils/dio_http.dart';
import '../utils/string_is_null_or_empty.dart';

//3.编写无状态组件
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var repeatPasswordController = TextEditingController();

  bool showPassword = false;

  //注册请求
  _registerHandler() async {
    var username = usernameController.text;
    var password = passwordController.text;
    var repeatPassword = repeatPasswordController.text;

    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      CommonToast.showToast('用户名或密码不能为空');
      return;
    }

    if (password != repeatPassword) {
      CommonToast.showToast('两次输入的密码不一致');
      return;
    }

    var path = "/user/register";
    var data = {"username": username, "password": password};
    FormData formData =
        FormData.fromMap({"username": username, "password": password});

    try {
      var res = await DioHttp.of(context).post(path, data);
      print('*** *** res = $res');
      //解析返回结果
      var resString = json.decode(res.toString());
      int status = resString['status'];
      String description = resString['description'] ?? '内部错误';
      CommonToast.showToast(description);
      if (status.toString().startsWith('2')) {
        Navigator.of(context).pushReplacementNamed('/login');
      }

    } catch (e) {
      // Handle other format or parsing issues
      print('&&&& Unexpected error during parsing: $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    //4.使用 PageContent
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          '注 册',
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
              decoration: const InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: repeatPasswordController,
              obscureText: !showPassword,
              decoration: const InputDecoration(
                labelText: '确认密码',
                hintText: '请输入确认密码',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  _registerHandler();
                },
                child: const Text(
                  '注 册',
                  style: TextStyle(color: Colors.white),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('已有账号，'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text(
                      '去登陆~',
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
