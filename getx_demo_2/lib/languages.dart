
import 'package:get/get.dart';

//定义国际化语言，需要继承 Translations 并重写 keys 方法
class Languages extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': {
      'hello': '你好, 世界',
    },
    'en_US': {
      'hello': 'Hello World',
    },

  };

}