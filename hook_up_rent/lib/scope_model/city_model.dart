
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

class CityModel extends Model {

  late GeneralType _city;

  set city(GeneralType city) {
    _city = city;
    notifyListeners();
  }

  GeneralType get city {
    return _city;
  }

}