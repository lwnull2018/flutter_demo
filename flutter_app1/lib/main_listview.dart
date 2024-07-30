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
          title: Text('Welcome ---- ListView')
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
      )
    );
  }
}

