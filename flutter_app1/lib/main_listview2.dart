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
            appBar: AppBar(title: Text('Welcome ---- ListView 横向列表')),
            body: Center(
                child: Container(
              child: MyList(),
              width: 500,
              height: 200,
              color: Colors.grey,
            ))
        )
    );
  }
}

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      scrollDirection: Axis.horizontal,
      children: [
        new Container(
          width: 180,
          color: Colors.lightGreen,
        ),
        new Container(
          width: 180,
          color: Colors.lightBlue,
        ),
        new Container(
          width: 180,
          color: Colors.amber,
        ),
        new Container(
          width: 180,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
