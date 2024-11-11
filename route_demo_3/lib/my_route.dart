

import 'package:flutter/material.dart';
import 'package:route_demo_3/main.dart';

final Map<String, Function> routes = {
  "/": (context) => const HomeScreen(),
  "/second": (context, {arguments}) => SecondScreen(argument: arguments,),
  "/passArguments": (context, {arguments}) => PassArgumentScreen(title: arguments.title, message: arguments.message,)
};

//定义通用的 onGenerateRoute
var onGenerateRoute = (RouteSettings settings) {
  //setting 中两个属性 name 表示路由名称，arguments传递的参数若是无参则这个为null
  //1.获取当前调用的路由名称
  //2.查找我们上面定义的Map路由表中是否包含此路由，并取出方法
  //3.取出对应的参数
  //4.判断不为null表示找到了某个路由定义的方法
  //5.判断setting中的arguments 不为null
  //6.返回要跳转的页面和传递参数
  //7.使用我们获取到的Fuction 调用带参数的去传递参数
  //8.否则使用我们获取到的Function调用不带参数的
  String? routeName = settings.name;
  Function? pageContentBuilder = routes[routeName];
  Object? args = settings.arguments;
  if(pageContentBuilder != null) {
    if(args != null) {
      final Route route = MaterialPageRoute(builder: (context) {
        return pageContentBuilder(context, arguments: args);
      });
      return route;
    } else {
      return MaterialPageRoute(builder: (context) => pageContentBuilder(context));
    }
  }
};