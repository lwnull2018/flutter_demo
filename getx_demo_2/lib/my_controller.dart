
import 'package:get/get.dart';
import 'package:getx_demo_2/teacher.dart';

/*
  自定义控制器继承自GetxController
 */
class MyController extends GetxController {
  //第一种
  // var teacher = Teacher();
  // void convertToUpperCase() {
  //    teacher.name.value = teacher.name.value.toUpperCase();
  // }

  //第二种
  // var teacher = Teacher('Telegram', 30).obs;
  // void convertToUpperCase() {
  //   teacher.update((val) {
  //     teacher.value.name = teacher.value.name.toString().toUpperCase();
  //   });
  // }

  //第三种

  var teacher = Teacher();
  void convertToUpperCase() {
    teacher.name.value = teacher.name.value.toUpperCase();
    update();
  }



}