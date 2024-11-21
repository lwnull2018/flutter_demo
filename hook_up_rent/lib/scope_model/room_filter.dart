import 'package:scoped_model/scoped_model.dart';

import '../pages/home/tab_search/filter_bar/data.dart';

//scoped_model 作为数据中转站，可以订阅、更新模型中的数据，用于将不同组件的数据关联起来
class FilterBarModel extends Model {
  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];

  //选中项列表
  Set<String> _selectedList = Set<String>();

  Map<String, List<GeneralType>> get dataList {
    var result = Map<String, List<GeneralType>>();
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;

    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList']!;
    _orientedList = data['orientedList']!;
    _floorList = data['floorList']!;
    notifyListeners();//通知订阅者
  }

  //获取选中列表
  Set<String> get selectedList {
    return _selectedList;
  }

  void selectedToggleItem(String data) {
    if(_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners();
  }

}
