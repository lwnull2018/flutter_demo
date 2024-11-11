import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'download_with_chunk.dart';

class DownloadChunkDemo extends StatefulWidget {

  const DownloadChunkDemo({super.key});

  @override
  State<DownloadChunkDemo> createState() => _DownloadChunkDemoState();

}

class _DownloadChunkDemoState extends State<DownloadChunkDemo> {

  bool _loading = false;
  String _text = "https://www.dcloud.io/?md_download_url=https%3A%2F%2Fqiniu-ecdn.dcloud.net.cn%2Fdownload%2FHBuilderX.4.29.2024093009.dmg&md_download_filename=";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: _loading ? null : download,
            child: const Text("分块下载"),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(_text.replaceAll(RegExp(r"\s"), "")),
          )
        ],
      ),
    );
  }

  download() async {
    setState(() {
      _loading = true;
      _text = "正在请求下载...";
    });

    try {

      var url = "https://www.dcloud.io/?md_download_url=https%3A%2F%2Fqiniu-ecdn.dcloud.net.cn%2Fdownload%2FHBuilderX.4.29.2024093009.dmg&md_download_filename=";
      var savePath = "HBuilderX.4.29.2024093009.dmg";
      await downloadWithChunks(url, savePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          print("${(received / total * 100).floor()}%");
        }
      });

    } catch(e) {
      print('错误:$e');
      _text = "错误:$e";
    } finally {
      setState(() {
        _loading = false;
      });
    }

  }

}
