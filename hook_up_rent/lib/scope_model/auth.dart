
import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

import '../utils/store.dart';

class AuthModel extends Model {
  String _token = '';

  //获取token方法
  String get token => _token;

  //是否登录
  bool get isLogin => _token!='';

  //初始化APP
  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if(!stringIsNullOrEmpty(token)) {
      login(token, context);
    }
  }

  //登录--通知订阅者
  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();//通知所有订阅者
  }

  //退出登录--通知订阅者
  void logout() {
    _token = '';
    notifyListeners();
  }

}