
import 'package:get/get.dart';

class MonitorController extends GetxController {

  var count = 0.obs;

  void increment() {
    count++;
  }

  //重写监听事件
  @override
  void onInit() {

    //监听count的值，当它发生改变时调用
    ever(count, (callback) => print('ever --- count:$count'));

    //监听多个值，当它们发生改变时触发
    // everAll([count], (callback) => print('everAll --- count:$count'));

    //count值发生改变时，只触发一次
    // once(count, (callback) => print('once count:$count'));

    //用户停止输入时1秒后触发一次，防止DDos攻击
    // debounce(count, (callback) => print('debounce count:$count'));

    //忽略3秒内的所有变动
    // interval(count, (callback) => print('interval count:$count'));


    super.onInit();
  }

}