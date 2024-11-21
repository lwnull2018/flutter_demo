import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes/router_table.dart';
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
    return ScopedModel<FilterBarModel>(//使用ScopeModel时，需要将ScopedModel放在顶层入口MaterialApp之上，这样就能进行全局状态管理
      model: FilterBarModel(),
      child: MaterialApp(
        // color: Colors.green,
        theme: ThemeData(primaryColor: Colors.green),
        // home: LoginPage(),
        onGenerateRoute: RouterTable.onGenerateRoute,
        // routes: {
        //   "/": (cotext) => const HomePage(),
        //   "/login": (cotext) => const LoginPage(),
        //   "/:pathMatch(.*)*": (cotext) => const NotFoundPage(),
        // },
      ),
    );
  }

}
