import 'package:flutter/material.dart';
import 'package:hook_up_rent/pages/home/info/index.dart';

import 'advertisement.dart';
import 'function_button.dart';
import 'header.dart';

class TabProfile extends StatefulWidget {

  const TabProfile({super.key});

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('我的'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/setting');
          },
          icon: const Icon(Icons.settings)
          ),
        ],
      ),
      body: ListView(
        children: [
          TabHeader(),
          FunctionButton(),
          Advertisement(),
          Info(showTitle: true,),
        ],
      ),
    );
  }

}
