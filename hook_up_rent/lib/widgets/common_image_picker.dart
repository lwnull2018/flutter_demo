import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages = [
  'https://pages.anjukestatic.com/usersite/touch/img/appdownload/esf.png',
  'https://pic4.ajkimg.com/m/52721b134412a65fc511f60ea1d763c2/275x206n.jpg',
  'https://pic4.ajkimg.com/m/9d43383adbae01b990a71808429320e4/275x206n.jpg',
];

// 设置图片宽高
var imageWidth = 278.0;
var imageHeight = 183.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<XFile>> onChange;

  const CommonImagePicker({super.key, required this.onChange});

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  List<XFile> files = [];

  final ImagePicker _picker = ImagePicker();
  //从相册获取图片
  _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (null == image) return;
    setState(() {
      files = files..add(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;

    //新增按钮
    Widget addWidget = GestureDetector(
      onTap: () {
        _pickImage();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: width,
        height: height,
        color: Colors.grey.shade200,
        child: const Center(
          child: Text(
            '+',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 40.0,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    //图片包装方法
    Widget wrapper(XFile curFile) {
      // return Image.network(imageUrl, width: width, height: height,);
      File file = File(curFile.path);
      return Stack(
        clipBehavior: Clip.none, // 允许子组件在边界外渲染
          children: [
        Image.file(
          file,
          width: width,
          height: height,
        ),
        //删除按钮
        Positioned(
          top: -20.0,
          right: -20.0,
            child: IconButton(
              onPressed: () {
                setState(() {
                  files = files..remove(curFile);
                });
                if(widget.onChange != null) {
                  widget.onChange(files);
                }
              },
              icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                      ),
            )),
      ]);
    }

    //图片列表
    List<Widget> list = files.map((item) => wrapper(item)).toList()
      ..add(addWidget);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: list,
      ),
    );
  }
}
