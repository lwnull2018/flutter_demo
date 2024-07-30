import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  const ExpansionPanelListDemo({super.key});

  @override
  State<ExpansionPanelListDemo> createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {

  List<int> mList = [];

  List<ExpandStateBean> expandList = [];

  _ExpansionPanelListDemoState() {
    for(int i=0; i<10; i++) {
      mList.add(i);
      expandList.add(ExpandStateBean(false, i));
    }
  }

  _setCurrentIndex(int index, bool isOpen) {
    setState(() {
      expandList.forEach((element) {
        if(index == element.index) {
          element.isOpen = !element.isOpen;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('expansion panel list'),),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol) {
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text('This is No.$index'),
                  );
              },
              body: ListTile(
                title: Text('expansion no.$index'),
              ),
              isExpanded: expandList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }

}

class ExpandStateBean {

  bool isOpen = false;
  int index = 0;

  ExpandStateBean(this.isOpen, this.index);

}
