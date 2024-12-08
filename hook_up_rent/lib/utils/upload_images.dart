
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hook_up_rent/utils/dio_http.dart';
import 'package:hook_up_rent/utils/scoped_model_helper.dart';
import 'package:image_picker/image_picker.dart';

import '../scope_model/auth.dart';

Future<String> updateImages(BuildContext context, List<XFile> files) async {
  if(files.isEmpty) return Future.value('');

  var token = ScopedModelHelper.getModel<AuthModel>(context).token;
  Map<String, dynamic> map = {
    'file': ''
  };
  var formData = FormData.fromMap({'file': files.map((file) => MultipartFile.fromFile(file.path, filename:file.name)).toList()});

  var url = '/houses/image';
  //发送请求，处理返回
  var result = await DioHttp.of(context).postFormData(url, formData, token);
  var resMap = json.decode(result.toString())['body'];
  String images = List<String>.from(resMap).join('|');

  return Future.value(images);
}