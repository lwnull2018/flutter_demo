
import 'package:flutter/material.dart';
import 'package:route_demo_2/tip_route.dart';

class RouterTestRoute extends StatelessWidget {

  const RouterTestRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          //打开'TinRoute' 并等待返回结果
          var result = await Navigator.push(
              context, 
              MaterialPageRoute(builder: (context){
                // 路由参数
                return const TipRoute(text: '我是提示XXX');
              })
          );
          print('路由返回值：$result');
        } ,
        child: const Text('打开提示页'),
      ),
    );
  }

}
