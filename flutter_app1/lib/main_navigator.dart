import 'package:flutter/material.dart';

void main() {
  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo ',
        // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
        home: Scaffold(
            appBar: AppBar(title: const Text('导航页')),
            body: Center(
                child: TextButton(
                   child: const Text('查看商品详情页'),
                   onPressed: (){
                     Navigator.of(context).push(
                         MaterialPageRoute(
                            builder: (context)=> SecondScreen()
                         )
                     );
                   },
                )
            )
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('商品详情页'),),
      body: Center(
        child: TextButton(
          child: const Text('返回'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

}