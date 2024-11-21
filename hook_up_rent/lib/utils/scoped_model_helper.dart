import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//工具类，用于获取ScopedModel对象
class ScopedModelHelper {

  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

}