import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo ',
        // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
        home: Scaffold(
            appBar: AppBar(title: Text('Welcome ---- GridView 网格列表')),
            body: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0,
                crossAxisCount: 3,//列数
                crossAxisSpacing: 2.0, //列间的距离
                childAspectRatio: 0.75 //宽高比
              ),
              children: [
                new Image.network('https://picx.zhimg.com/80/v2-bab208e7fda30547a39ce78cebf2ec39.jpg'),
                new Image.network('https://pic1.zhimg.com/80/v2-3c670be31e2c756530b503c651f3ef5c.jpg'),
                new Image.network('https://pica.zhimg.com/80/v2-469d78181c8b03e5fb063c6b707ce6e5.jpg'),
                new Image.network('https://picx.zhimg.com/80/v2-4877b8300fe03bd693f63eabc8cdf839.jpg'),
                new Image.network('https://pica.zhimg.com/80/v2-08e01cfdb3fd444567e0a541bd6fbb05.jpg'),
                new Image.network('https://pica.zhimg.com/80/v2-5b548c0089f4eda5e406f7231083b236.jpg'),
                new Image.network('https://pica.zhimg.com/80/v2-29fb8d08b7b232bb0034ee5b1a9786aa.jpg'),
                new Image.network('https://pic1.zhimg.com/80/v2-e0ab8794474bad50890c406f00d664c8.jpg'),
                new Image.network('https://picx.zhimg.com/80/v2-22e5c0143e2f193a8668d373bd524314.jpg'),
                new Image.network('https://picx.zhimg.com/80/v2-3409bc6e85d986f669dd822a0e5d2cb5.jpg'),
              ],
            )
            /*body: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              children: [
                new Text('I love web'),
                new Text('flutter.io'),
                new Text('google.com'),
                new Text('我喜欢跑步'),
                new Text('我喜欢喝酒'),
                new Text('我喜欢打羽毛球'),
              ],
            )*/
        )
    );
  }
}

