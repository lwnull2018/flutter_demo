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
            appBar: AppBar(title: Text('Welcome ---- Row Widget 水平方向布局')),
            body: Row(
              children: [
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                    ),
                    onPressed: (){},
                    child: const Text('grey')
                ),
                Expanded(//灵活布局
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.redAccent,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.access_alarm),
                    label: const Text('TextButton.icon #2'),
                  ),
                ),
                TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: (){},
                    child: const Text('blue')
                ),
              ],
            )

        )
    );
  }
}

