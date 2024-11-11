
import 'dart:ui';

import 'package:get/get.dart';

class InternationalizationController extends GetxController {

  //切换语言
  void changeLanguage(String languageCode, String countryCode) {
      var local = Locale(languageCode, countryCode);
      Get.updateLocale(local);
  }

}