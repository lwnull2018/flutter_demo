
import 'package:get/get.dart';

class GetXUniqueController extends GetxController {

  var count = 0.obs;

  void increment() {
    count++;
    update(['my_count']);//更新指定ID
  }
}