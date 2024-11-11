//1.新建 /pages/home/index.dart
//2.添加 material、 page_content 依赖
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/page_content.dart';

//3.编写无状态组件

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    //4.使用 PageContent
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('登 陆', style: TextStyle(color: Colors.white),),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '请输入用户名',
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
              obscureText: !showPassword,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '请输入密码',
                suffixIcon: IconButton(icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility), onPressed: () {
        
                  setState(() {
                    showPassword = !showPassword;
                  });
                }, ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.green), onPressed: () {}, child: Text('登陆', style: TextStyle(color: Colors.white),)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('还没有账号，'),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/register');
                    },
                    child: Text('去注册~', style: TextStyle(color: Colors.green),)),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
