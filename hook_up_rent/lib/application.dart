import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes/router_table.dart';

//application应用根组件
class Application extends StatelessWidget {

  const Application({super.key});

  @override
  Widget build(BuildContext context) {

    // final router = FluroRouter();
    //配置路由
    // Routes.configureRoutes(router);
    // RouteSettings routeSettings =  RouteSettings(name: "/");
    return MaterialApp(
      // color: Colors.green,
      theme: ThemeData(primaryColor: Colors.green),
      // home: LoginPage(),
      onGenerateRoute: RouterTable.onGenerateRoute,
      // routes: {
      //   "/": (cotext) => const HomePage(),
      //   "/login": (cotext) => const LoginPage(),
      //   "/:pathMatch(.*)*": (cotext) => const NotFoundPage(),
      // },
    );
  }

}
