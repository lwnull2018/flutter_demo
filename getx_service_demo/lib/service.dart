import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service extends GetxService {

  Future<void> getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int count = (prefs.getInt('counter')??0) + 1;
    print('count的值:$count');
    await prefs.setInt('counter', count);
  }

}