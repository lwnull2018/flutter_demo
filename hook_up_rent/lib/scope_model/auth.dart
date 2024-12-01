
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/user_info.dart';
import '../utils/dio_http.dart';
import '../utils/store.dart';

class AuthModel extends Model {
  String _token = '';
  UserInfo? _userInfo;

  //获取token方法
  String get token => _token;

  //是否登录
  bool get isLogin => _token!='';

  //get方法
  UserInfo? get userInfo => _userInfo;

  //初始化APP
  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if(!stringIsNullOrEmpty(token)) {
      login(token, context);
    }
  }

  _getUserInfo(BuildContext context) async {
    const url = '/user/token';
    var res = await DioHttp.of(context).get(url, {}, _token);
    var resMap = json.decode(res.toString());
    var data = resMap['body'];
    var userInfo = UserInfo.fromJson(data);
    _userInfo = userInfo;
    notifyListeners();
  }

  //登录--通知订阅者
  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();//通知所有订阅者
    _getUserInfo(context);
  }

  //退出登录--通知订阅者
  void logout() {
    _token = '';
    _userInfo = null;
    notifyListeners();
  }

}