import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys {
  token,
  city
}

//封装 shared_preferences
class Store {

  static StoreKeys? storeKeys;
  final SharedPreferences _store;

  static Future<Store> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Store._internal(prefs);
  }

  Store._internal(this._store);

  getString(StoreKeys key) async{
    return _store.getString(key.toString());
  }

  setString(StoreKeys key, String val) async {
    _store.setString(key.toString(), val);
  }

  getStringList(StoreKeys key) async {
    return _store.getStringList(key.toString());
  }

  setStringList(StoreKeys key, List<String> list) async {
    _store.setStringList(key.toString(), list);
  }

}