
import 'package:get/get.dart';

class MyLifeCycleController extends GetxController {

  var count = 0.obs;

  Future<void> increment() async {
    print('increment 方法被调用...');
    await Future.delayed(Duration(seconds: 3));
    count++;
    update();
    print('increment 调用完成...');
  }
  
  void cleanTask() {
    print('清除任务...');
  }

  @override
  void onInit() {
    print('初始化');
    super.onInit();
  }

  @override
  void onReady() {
    print('加载完成');
    super.onReady();
  }

  @override
  void onClose() {
    print('控制器被释放');
    super.onClose();
  }

}