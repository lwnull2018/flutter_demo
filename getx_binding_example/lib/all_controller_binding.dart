import 'package:get/get.dart';
import 'package:getx_binding_example/binding/binding_home_controller.dart';

import 'binding/binding_my_controller.dart';

class AllControllerBinding extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BindingHomeController());
    Get.lazyPut(() => BindingMyController());
  }

}