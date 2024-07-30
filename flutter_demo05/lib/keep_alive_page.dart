import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin {

  int _counter = 0;

  @override
  bool get wantKeepAlive => true;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('点一次增加一个数字'),
            Text('$_counter', style: Theme.of(context).textTheme.displayMedium)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
