import 'package:flutter/material.dart';
import 'custome_route.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('First Page', style: TextStyle(fontSize: 36)),
        elevation: 0, //融合属性,0完全融合没有断层的感觉
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(CustomeRoute(const SecondPage()));
          },
          child: const Icon(Icons.navigate_next, color: Colors.white, size: 64),
        ),
      ),
    );
  }

}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: const Text('SecondPage', style: TextStyle(fontSize: 36),),
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Center(
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.navigate_before, color: Colors.white, size: 64),
          ),
        ),
      ),
    );
  }
}
