import 'package:flutter/material.dart';

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My'),),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('个人中心', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.lightBlue, fontSize: 50),)
          ],
        ),
      ),
    );
  }

}
