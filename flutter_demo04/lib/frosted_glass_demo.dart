import 'package:flutter/material.dart';
import 'dart:ui';

//磨砂玻璃组件
class FrostedGlassDemo extends StatelessWidget {
  const FrostedGlassDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConstrainedBox(//约束盒子组件，添加额外的约束条件child上
              constraints: const BoxConstraints.expand(),
              child: Image.network('http://gips3.baidu.com/it/u=3886271102,3123389489&fm=3028&app=3028&f=JPEG&fmt=auto?w=1280&h=960'),
          ),
          Center(
            child: ClipRect(//可裁切的矩形
              child: BackdropFilter(//背景过滤器
                filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),
                child: Opacity(
                  opacity: 0.5,
                    child: Container(
                      width: 500.0,
                      height: 700.0,
                      decoration: BoxDecoration(color: Colors.grey.shade200),//盒子修饰器
                      child: Center(
                        child: Text(
                          '小马哥',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}
