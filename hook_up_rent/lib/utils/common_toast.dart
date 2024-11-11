import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

//通用的toast组件
class CommonToast {

  static showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
    );
  }

}
