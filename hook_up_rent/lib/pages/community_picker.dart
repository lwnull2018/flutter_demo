
import 'package:flutter/material.dart';

import '../models/community.dart';

//小区选择器
class CommunityPickerPage extends StatefulWidget {

  const CommunityPickerPage({super.key});

  @override
  State<CommunityPickerPage> createState() => _CommunityPickerPageState();

}

class _CommunityPickerPageState extends State<CommunityPickerPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('小区选择'),),
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: ListView.separated(//分隔列表
          itemCount: list.length,
          itemBuilder: (context, index){
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: (){
                Navigator.of(context).pop(list[index]);
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(list[index].name),
              ),
            );
          },
          //分隔符
          separatorBuilder: (_context, _) => const Divider(),
        ),
      ),
    );
  }

}
