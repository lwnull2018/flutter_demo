import 'package:flutter/material.dart';

class HelloItem {

  final Text text;
  final GestureTapCallback? onTap;
  const HelloItem({required this.text, this.onTap});

}