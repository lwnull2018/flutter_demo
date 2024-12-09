import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes/router_table.dart';
import 'package:hook_up_rent/scope_model/auth.dart';
import 'package:hook_up_rent/scope_model/city_model.dart';
import 'package:hook_up_rent/scope_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';

//application应用根组件
class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // final router = FluroRouter();
    //配置路由
    // Routes.configureRoutes(router);
    // RouteSettings routeSettings =  RouteSettings(name: "/");
    return ScopedModel(
      model: CityModel(),
      child: ScopedModel(
        model: AuthModel(),
        child: ScopedModel<FilterBarModel>(
          //使用ScopeModel时，需要将ScopedModel放在顶层入口MaterialApp之上，这样就能进行全局状态管理
          model: FilterBarModel(),
          child: MaterialApp(
            // color: Colors.green,
            theme: ThemeData(
              primaryColor: Colors.green,
              //背景色：透明
              splashColor: Colors.transparent,
              // 点击时的高亮效果设置为透明
              highlightColor: Colors.transparent,
            ),
            // home: LoginPage(),
            onGenerateRoute: RouterTable.onGenerateRoute,
            initialRoute: RouterTable.loading,
            // routes: {
            //   "/": (cotext) => const HomePage(),
            //   "/login": (cotext) => const LoginPage(),
            //   "/:pathMatch(.*)*": (cotext) => const NotFoundPage(),
            // },
          ),
        ),
      ),
    );
  }
}
