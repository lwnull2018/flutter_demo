import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  const ExpansionTileDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Center(
        child: ExpansionTile(
          title: Text('Expansion Tile'),
          leading: Icon(Icons.ac_unit),//开头图标
          backgroundColor: Colors.white12,
          initiallyExpanded: true,
          children: [
            ListTile(
              title: Text('list title'),
              subtitle: Text('subtitle'),
            )
          ],
        ),
      ),
    );
  }

}
