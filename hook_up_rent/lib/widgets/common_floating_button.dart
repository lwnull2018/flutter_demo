import 'package:flutter/material.dart';


//公共的浮标按钮组件
class CommonFloatingButton extends StatelessWidget {
  final String title;
  final Function? onTap;

  const CommonFloatingButton(
      this.title,
      this.onTap, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (null != onTap && onTap is Function) {
          onTap!();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.green,
        ),
        child: Center(
          child: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}