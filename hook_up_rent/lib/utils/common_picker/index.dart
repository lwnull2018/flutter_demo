import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//弹出框选择的工具类
class CommonPicker {
  static Future<int?> showPicker(
      BuildContext context, List<String> options, int value, {double height=300.0}) {
    var buttonTextStyle = TextStyle(
        color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600);

    //绑定初始值
    var controller = FixedExtentScrollController(initialItem: value);
    return showCupertinoModalPopup<int>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.grey,
            height: height,
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  color: Colors.grey.shade200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            '取消',
                            style: buttonTextStyle,
                          )),
                      TextButton(
                          onPressed: () {
                            //传回选中的值
                            Navigator.of(context).pop(controller.selectedItem);
                          },
                          child: Text('确定', style: buttonTextStyle)),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: CupertinoPicker(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    scrollController: controller,
                    itemExtent: 30.0,
                    onSelectedItemChanged: (int value) {},
                    children: options.map((item) => Text(item)).toList(),
                  ),
                ))
              ],
            ),
          );
        });
  }
}
