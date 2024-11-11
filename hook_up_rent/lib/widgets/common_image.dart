import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final networkUriRef = RegExp('^http');
final localUriRef = RegExp('^static');

//公共图片组件，支持网络图片与本地图片的使用
class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const CommonImage(
      {super.key, required this.src, this.width, this.height, this.fit});

  @override
  Widget build(BuildContext context) {
    if (networkUriRef.hasMatch(src)) {
      return Image(
        width: width,
        height: height,
        fit: fit,
        image: CachedNetworkImageProvider(src),
        /*AdvancedNetworkImage(
          src,
          useDiskCache: true,
          timeoutDuration: const Duration(seconds: 20),
          cacheRule: const CacheRule(maxAge: Duration(days: 7)),
        ),*/
      );
    } else if (localUriRef.hasMatch(src)) {
      return Image.asset(
        src,
        width: width,
        height: height,
        fit: fit,
      );
    }

    assert(false, '图片地址 src:$src 不合法!');
    return Container();
  }
}
