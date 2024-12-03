import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../config.dart';
import '../scope_model/city_model.dart';

//工具类，用于获取ScopedModel对象
class ScopedModelHelper {

  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

  static String getAreaId(BuildContext context) {
    return ScopedModelHelper.getModel<CityModel>(context).city.id?? Config.availableCitys.first.id;
  }
}