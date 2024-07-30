import 'package:flutter/material.dart';
import 'keep_alive_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KeepAliveWidget(),
    );
  }
}


class KeepAliveWidget extends StatefulWidget {
  const KeepAliveWidget({super.key});

  @override
  State<KeepAliveWidget> createState() => _KeepAliveWidgetState();
}

class _KeepAliveWidgetState extends State<KeepAliveWidget> with SingleTickerProviderStateMixin {

  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('保持页面状态'),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(icon: Icon(Icons.directions_car),),
            Tab(icon: Icon(Icons.directions_transit),),
            Tab(icon: Icon(Icons.directions_bike),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
        ],
      ),
    );
  }

}

