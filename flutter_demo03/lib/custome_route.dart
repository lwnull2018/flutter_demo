import 'package:flutter/material.dart';

//自定义路由
class CustomeRoute extends PageRouteBuilder {

  final Widget widget;

  CustomeRoute(this.widget):super(
    transitionDuration: const Duration(seconds: 1),//动画效果耗时
    pageBuilder: (
        BuildContext context,
        Animation animation1,
        Animation animation2,
        ) {
          return widget;
    },
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child
    ) {
      //路由动画效果的模式 - 渐隐渐现的路由动画效果
      /*return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(
                    parent: animation1,
                    curve: Curves.fastOutSlowIn
          )),
          child: child, // 子元素
      );*/

      //缩放的动画效果
      /*return ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0)
                .animate(
                  CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)
                ),
                child: child,
      );*/

      //旋转+缩放动画效果
      /*return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
        child: ScaleTransition(
          scale: Tween(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(
                      parent: animation1,
                      curve: Curves.fastOutSlowIn
                  )),
          child: child,
        ),
      );*/

      //左右滑动路由
      return SlideTransition(
          position: Tween<Offset> (
            begin: const Offset(-1.0, 0.0),
            end: const Offset(0.0, 0.0)
          ).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
          child: child,
      );

    }
  );



}