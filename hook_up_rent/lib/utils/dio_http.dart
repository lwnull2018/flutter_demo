import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../config.dart';

//公共网络请求类
class DioHttp {

  Dio? _client;
  BuildContext? _context;

  static DioHttp of(BuildContext context) {
    return DioHttp._internal(context);
  }

  //私有的命名构造函数，确保外部不能拿到它----初始化实例
  DioHttp._internal(BuildContext context) {

    if(_client == null || _context != context) {
      _context = context;
        var option = BaseOptions(
          baseUrl: Config.BaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 3),//包头
          headers: {
            "Content-Type": "application/json;Charset=UTF-8",
            "connect":"get"
          },
          //内容类型
          contentType: 'application/json;Charset=UTF-8',
          // extra: {'context': context},//额外参数
        );
      _client = Dio(option);
    }


  }

  //get请求
  Future<Response<Map<String, dynamic>>?> get(String path, Map<String, dynamic> parameter, String token) async {
    var options = Options(headers: {'Authorization': token});
    parameter['token'] = token;
    return await _client?.get(path,queryParameters: parameter, options: options);
  }

  //get请求
  Future<Response?> get2(String path, Map<String, dynamic> parameter) async {
    var option = BaseOptions(
      baseUrl: Config.BaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 3),
    );
    // final dio = Dio(option);
    // final response = await dio.get(path);
    final response =  await _client?.get(path,queryParameters: parameter);
    print('response = $response');
    return response;
  }

  //get请求
  Future<Response<Map<String, dynamic>>?> get3(String path) async {
    return await _client?.get(path);
  }

  //post请求
  Future<Response<Map<String, dynamic>>?> post(String path, Map<String, dynamic> data) async {
    // var options = Options(headers: {'Authorization': token});
    var options = Options(responseType: ResponseType.json);
    return await _client?.post(path,data: data, options: options);
  }


  //post请求上传表单数据
  Future<Response<Map<String, dynamic>>?> postFormData(String path, FormData formData, String token) async {
    var options = Options(
        headers: {'Authorization': token}, contentType: 'multipart/form-data');
    return await _client?.get(path, data: formData, options: options);
  }

}
