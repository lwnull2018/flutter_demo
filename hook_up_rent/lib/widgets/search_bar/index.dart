import 'dart:convert';

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/config.dart';
import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:hook_up_rent/scope_model/city_model.dart';
import 'package:hook_up_rent/utils/common_toast.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

import '../../utils/store.dart';

class SearchBarWidget extends StatefulWidget {
  final bool? shwoLocation;
  final Function? goBackCallback;
  final String? inputValue;
  final String? defaultInputValue;
  final Function? onCancel;
  final bool? showMap;
  final Function? onSearch;
  final ValueChanged<String>? onSearchSubmit;

  const SearchBarWidget(
      {super.key,
      this.shwoLocation,
      this.goBackCallback,
      this.inputValue = '',
      this.defaultInputValue = '请输入搜索词',
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String _searchWord = '';
  late FocusNode _focusNode;
  late TextEditingController _controller;

  _onClean() {
    _controller.clear();
    setState(() {
      _searchWord = '';
    });
  }

  _saveCity(GeneralType city) async {
    //1.保存到ScopedModel里
    ScopedModelHelper.getModel<CityModel>(context).city = city;
    //2.保存到本地缓存里
    var store = await Store.getInstance();
    var cityString = json.encode(city.toJson());
    store.setString(StoreKeys.city, cityString);
  }

  _changeLocation() async {
    var result = await CityPickers.showCitiesSelector(
        context: context,
        theme: ThemeData(primaryColor: Colors.green),
    );
    String? cityName = result?.cityName;
    if(null == cityName) return null;
    try {
      var city = Config.availableCitys.firstWhere((element) => cityName.startsWith(element.name));
      _saveCity(city);
    } catch(e) {
      CommonToast.showToast('该城市暂未开通！');
      return;
    }
  }

  _getCity() async {
    var store = await Store.getInstance();
    var cityString = await store.getString(StoreKeys.city);
    if(null == cityString) return;
    var city = GeneralType.fromJson(json.decode(cityString));
    ScopedModelHelper.getModel<CityModel>(context).city = city;
  }

  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var city;
    try {
      city = ScopedModelHelper.getModel<CityModel>(context).city;
    } catch(e) {
      city = Config.availableCitys.first;
      _getCity();
    }
    return Container(
      // padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          if (widget.shwoLocation != null)
            GestureDetector(
              onTap: () {
                _changeLocation();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                  ),
                  Text(
                    city.name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
          if (widget.goBackCallback != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.black87,
                ),
              ),
            ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50.0)),
              child: TextField(
                style: const TextStyle(fontSize: 14.0),
                controller: _controller,
                onChanged: (String value) {
                  _searchWord = value;
                },
                onTap: () {
                  if(null == widget.onSearchSubmit) {
                    _focusNode.unfocus();//失去焦点
                  }
                  widget.onSearch!();
                },
                onSubmitted: widget.onSearchSubmit,
                textInputAction: TextInputAction.search,//弹起的键盘会有个search按钮
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: -10.0, top: 4.0, bottom: 4.0),
                    border: InputBorder.none,
                    hintText: '请输入搜索词',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0),
                    //采用 prefixIcon 的图标右侧间距会比较大，所以改用icon组件
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _onClean,
                      child: Icon(
                        Icons.clear,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                    )),
              ),
            ),
          )),
          if (widget.onCancel != null)
            GestureDetector(
              onTap: () {},
              child: Text(
                '取消',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          if (widget.showMap != null)
            GestureDetector(
              onTap: () {},
              child: CommonImage(
                src: 'static/icons/widget_search_bar_map.png',
              ),
            )
        ],
      ),
    );
  }
}
