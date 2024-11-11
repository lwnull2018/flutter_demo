
import 'package:get/get.dart';

//逻辑层--控制器
class CounterController extends GetxController {
  //定义该变量为响应式变量，当该变量数值变化时，页面的刷新方法将自动刷新
  var count = 0.obs;

  // 自增方法
  void increase() => ++count;

}