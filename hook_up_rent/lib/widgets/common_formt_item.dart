import 'package:flutter/material.dart';

//公共的FormItem组件
class CommonFormItem extends StatelessWidget {

  final String label;
  final Widget Function(BuildContext context)? contentBuilder;
  final Widget? suffix;
  final String? suffixText;
  final String? hitText;
  final ValueChanged? onChanged;
  final TextEditingController? controller;

  const CommonFormItem({super.key, required this.label, this.contentBuilder, this.suffix, this.suffixText, this.hitText, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Theme.of(context).dividerColor),//获取主题色
        )
      ),
      padding: EdgeInsets.only(left: 14.0, right: 14.0),
      child: Row(
        children: [
          Container(
            width: 80.0,
              child: Text(label , style: TextStyle(fontSize: 16.0, color: Colors.black87),)
          ),
          Expanded(
            child: null!=contentBuilder ? contentBuilder!(context) :
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hitText,
              ),
            ),
          ),
          if(null!=suffix) suffix!,
          if(null==suffix && suffixText!=null) Text(suffixText!, style: TextStyle(fontSize: 16.0, color: Colors.black87),),
        ],
      ),
    );
  }

}
