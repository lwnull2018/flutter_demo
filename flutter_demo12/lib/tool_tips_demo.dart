import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  const ToolTipDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('tool tips demo')),
      body: Center(
        child: Tooltip(
            message: '不要碰我，我怕痒',
            child: Image.network('http://gips3.baidu.com/it/u=100751361,1567855012&fm=3028&app=3028&f=JPEG&fmt=auto?w=960&h=1280'),
        ),
      ),
    );
  }

}
