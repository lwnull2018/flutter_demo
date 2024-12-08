import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';
import 'package:hook_up_rent/scope_model/auth.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';

//启动页
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}



class _LoadingPageState extends State<LoadingPage> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('static/images/loading.jpg'),
              fit: BoxFit.fill
          ) ),
    );
  }

  @override
  void initState() {
    //延时跳转
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/');
    });

    Timer.run(() {
      ScopedModelHelper.getModel<AuthModel>(context).initApp(context);
    });

    super.initState();
  }
}
