import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/email_screen.dart';
import 'pages/pages_screen.dart';
import 'pages/airplay_screen.dart';

//动态组件
class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  int _currentIndex = 0;

  List<Widget> pageList = [];

  final _BottomNavigationColor = Colors.blue;

  @override
  void initState() {
    pageList
            ..add(HomeScreen())
            ..add(PagesScreen())
            ..add(EmailScreen())
            ..add(AirplayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home,
                  color: _BottomNavigationColor
              ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.email,
                  color: _BottomNavigationColor
              ),
            label: 'Email'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.airplay,
                  color: _BottomNavigationColor
              ),
            label: 'Airplay'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.pages,
                  color: _BottomNavigationColor
              ),
            label: 'Pages'
          )
        ],
        onTap: (int index){//响应事件
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex, //哪个高亮被选中了
        selectedItemColor: _BottomNavigationColor,
      ),
    );
  }

}

