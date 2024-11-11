import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {

  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('New Route'),
      ),
      body: Container(
        child: const Center(
          child: Text('This is new route'),
        ),
      ),
    );
  }

}
