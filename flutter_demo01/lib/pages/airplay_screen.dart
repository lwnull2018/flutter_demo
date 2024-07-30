import 'package:flutter/material.dart';

class AirplayScreen extends StatelessWidget {
  const AirplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Airplay'),),
      body: const Center(
        child: Text('Airplay'),
      ),
    );
  }

}
