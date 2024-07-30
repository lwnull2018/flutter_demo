import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomAppBarWidget extends StatefulWidget {
  const BottomAppBarWidget({super.key});

  @override
  State<BottomAppBarWidget> createState() => _BottomAppBarWidgetState();
}

class _BottomAppBarWidgetState extends State<BottomAppBarWidget> {

  List<Widget> list = [];

  int _index = 0;

  @override
  void initState() {
    list..add(EachView('Home'))..add(EachView('Pages'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                return  EachView('New Pages');
            }
          ));
        },
        tooltip: '长按给出提示信息',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //融合属性
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                color: Colors.white,
                tooltip: 'tooltip111',
                onPressed: () {
                  setState(() {
                    _index = 0;
                  });
                },
            ),
            IconButton(
                onPressed:(){
                  setState(() {
                    _index = 1;
                  });
                },
                icon: const Icon(Icons.pages),
                color: Colors.white
            ),
          ],
        ),
      ),
    );
  }
}
