import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));//闪屏停留5秒
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context)=> const MyHomePage()),
          (route) => false);
      }
    });

    _controller.forward();//播放动画
  }

  @override
  void dispose() {
    _controller.dispose();//销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
          'http://gips2.baidu.com/it/u=3944689179,983354166&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024',
        scale: 2.0,
        fit: BoxFit.cover),
    );
  }

}
