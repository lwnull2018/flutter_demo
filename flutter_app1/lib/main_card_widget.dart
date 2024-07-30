import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  //层叠样式 三个层叠样式布局
  var card = const Card(
    child: Column(
      children: [
        ListTile(
          title: Text('吉林省吉林市昌邑区'),
          subtitle: Text('张三:135666666666'),
          leading: Icon(Icons.account_box, color: Colors.lightBlue,),
        ),
        Divider(),
        ListTile(
          title: Text('吉林省吉林市昌邑区'),
          subtitle: Text('李四:135666666666'),
          leading: Icon(Icons.account_box, color: Colors.lightBlue,),
        ),
        Divider(),
        ListTile(
          title: Text('吉林省吉林市昌邑区'),
          subtitle: Text('王五:135666666666'),
          leading: Icon(Icons.account_box, color: Colors.lightBlue,),
        ),
      ],
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo ',
        // home: const MyHomePage(title: 'Flutter Demo Home Page 123'),
        home: Scaffold(
            appBar: AppBar(title: Text('Card Widget 卡片布局')),
            body: Center(child: card )
        )
    );
  }
}

