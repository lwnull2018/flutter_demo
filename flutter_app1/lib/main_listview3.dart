import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    items: new List<String>.generate(100, (index) => 'Item $index'), key: new Key('12334'),
  ));
}

class MyApp extends StatelessWidget {

  final List<String> items;

  //构造函数
  MyApp({required Key key, required this.items}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo ',
        // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
        home: Scaffold(
            appBar: AppBar(title: Text('Welcome ---- ListView 动态列表')),
            body: ListView.builder(
              itemCount: items.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: new Text('${items[index]}'),
                  );
                })
        )
    );
  }
}

