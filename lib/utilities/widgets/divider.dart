import 'package:flutter/material.dart';

class DividerWidget {
  static divider({ double top = 15, double bottom = 15, height = 1.0}) {
    return Container(
      margin: EdgeInsets.only(top: top, bottom: bottom),
      width: double.infinity,
      height: height,
      color: Color(0xfff2f2f2),
    );
  }
}