import 'package:flutter/material.dart';

class PagesScreen extends StatelessWidget {
  const PagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pages'),),
      body: const Center(
        child: Text('Pages'),
      ),
    );
  }

}
