import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/widgets/common_image.dart';

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

  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          if (widget.shwoLocation != null)
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.room,
                    color: Colors.green,
                  ),
                  Text(
                    '广州',
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
