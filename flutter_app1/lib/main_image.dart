import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo ',
      // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome ---- Image')
        ),
        body: Center(
            child: Container(
              child: new Image.network(
                'http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960',
                color: Colors.blueAccent,
                colorBlendMode: BlendMode.dst,
                repeat: ImageRepeat.repeat,
                // fit: BoxFit.contain,
              ),
              width: 300,
              height: 300,
              color: Colors.lightGreen,
            )
        )
      )
    );
  }
}

