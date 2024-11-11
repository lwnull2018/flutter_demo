
import 'package:flutter/material.dart';

class TipRoute extends StatelessWidget {

  const TipRoute({super.key, required this.text});//接收一个text参数

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('提示'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: [
              Text(text),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context, '我是提示页的返回值');//传参
                  },
                  child: const Text('返回')
              )
            ],
          ),
        ),
      ),
    );
  }

}
