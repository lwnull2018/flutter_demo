

import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/room_detail/index.dart';

import '../common/screen_arguments.dart';
import '../pages/community_picker.dart';
import '../pages/home/index.dart';
import '../pages/login.dart';
import '../pages/not_found.dart';
import '../pages/register.dart';
import '../pages/room_add/index.dart';
import '../pages/setting.dart';
import '../room_manage/index.dart';

class RouterTable {

  static String loginPath = '/login';
  static String registerPath = '/register';
  static String homePath = '/';
  static String notFoundPath = '404';
  static String roomDetailPath = '/roomDetail';
  static String settingPath = '/setting';
  static String roomManagePath = '/roomManage';
  static String roomAddPath = '/roomAdd';
  static String communityPicker = '/communityPicker';


  static Map<String, WidgetBuilder> routeTables = {

    //404页面
    notFoundPath: (context) => const NotFoundPage(),
    //注册
    registerPath: (context) => const RegisterPage(),
    //登录
    loginPath: (context) => const LoginPage(),
    //首页
    homePath: (context) => const HomePage(),

    //设置页
    settingPath: (context) => const SettingPage(),

    //房屋管理
    roomManagePath: (context) => const RoomManagePage(),

    //房屋发布
    roomAddPath: (context) => const RoomAddPage(),

    //房屋详情页 -- 传递参数
    roomDetailPath: (context, {params}) =>  RoomDetailPage(roomId: params),

    //小区选择器页面
    communityPicker: (context) => const CommunityPickerPage(),

  };


  ///路由拦截
  static Route onGenerateRoute<T extends Object>(RouteSettings settings) {
    return CupertinoPageRoute<T>(
      settings: settings,
      builder: (context) {
        String? name = settings.name;
        if (routeTables[name] == null) {
          name = notFoundPath;
        } else if(roomDetailPath == name) {//房屋详情页面路由
          if(settings.arguments != null) {
            final params = settings.arguments as Map<String, String>;
            return RoomDetailPage(roomId: params['id']!.toString());
          }
        }

        Widget widget = routeTables[name]!(context);

        return widget;
      },
    );
  }

}