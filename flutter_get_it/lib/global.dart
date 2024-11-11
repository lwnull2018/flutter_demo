import 'package:get_it/get_it.dart';

import 'common/utils/wp_http.dart';

class Global {

  static final getIt = GetIt.instance;

  static Future<void> init() async {
    // 注册单例 - WPHttp
    getIt.registerSingleton<WPHttp>(WPHttp());
  }

}
