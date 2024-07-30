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
      title: 'Flutter Demo 123',
      // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome ---- to Flutter 000123')
        ),
        body: new ListView(
          children: [
            new Image.network('http://gips2.baidu.com/it/u=195724436,3554684702&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960'),
            new Image.network('http://gips0.baidu.com/it/u=3560029307,576412274&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280'),
            new Image.network('http://gips1.baidu.com/it/u=1971954603,2916157720&fm=3028&app=3028&f=JPEG&fmt=auto?w=1920&h=2560'),
            new Image.network('http://gips3.baidu.com/it/u=4283915297,3700662292&fm=3028&app=3028&f=JPEG&fmt=auto?w=1440&h=2560'),
            /*new ListTile(
              leading: new Icon(Icons.abc_sharp),
              title: new Text('abc_sharp')
            ),
            new ListTile(
              leading: new Icon(Icons.access_alarms),
              title: new Text('access_alarms')
            ),
            new ListTile(
              leading: new Icon(Icons.accessible_forward),
              title: new Text('accessible_forward')
            )*/
          ],
        )
        /*Center(
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
          ),
          child: Container(//相当于 div
            child: new Text( 'Hello Flutter 123 567 中文的世界里，我愿意为前端事业奋斗一生，包括上半身，也包括下半身，侃侃，哈哈，呵呵～～～', style: TextStyle(fontSize: 25.0),),
            alignment: Alignment.topLeft,
            width: 500.0,
            height: 400.0,
            // color: Colors.lightBlue,
            padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            decoration: new BoxDecoration(//渐变色
              gradient: const LinearGradient(colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]),
              border: Border.all(width: 5, color: Colors.red)
            ),
          ),
          child: Text(
            'Hello Flutter 123 567 中文的世界里，我愿意为前端事业奋斗一生，包括上半身，也包括下半身，侃侃，哈哈，呵呵～～～',
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.0,
              color: Color.fromARGB(255, 255, 125, 125),
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.double
            ),
          ),
        ),*/
      )
    );
  }
}

