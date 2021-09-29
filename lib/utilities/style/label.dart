import 'package:flutter/material.dart';

class LabelStyle {
  static TextStyle input({double size = 16}) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Color(0xffA7A7A7),
      );

  static TextStyle inputLight({double size = 16}) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w400,
        color: Color(0xffA7A7A7),
      );

  static TextStyle blue({double size = 16}) => TextStyle(
        fontSize: size,
        color: Color(0xff2074D6),
      );

  static TextStyle blackBold({double size = 16}) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Color(0xff4A4A4A),
      );

  static TextStyle black({double size = 16}) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.normal,
        color: Color(0xff4A4A4A),
      );

  static TextStyle blackLight({double size = 16}) => TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        color: Color(0xff4A4A4A),
      );

  static TextStyle white({double size = 36}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle whiteLight({double size = 16}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle gray({double size = 16}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: Color(0xff898989),
  );

  static TextStyle grayDark({double size = 14}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: Color(0xff545454),
  );

  static TextStyle grayDarkLight({double size = 14}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w300,
    color: Color(0xff4A4A4A),
  );

  static TextStyle grayDarkBold({double size = 19}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: Color(0xff4A4A4A),
  );

  static TextStyle grayWhite({double size = 19}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w700,
    color: Color(0xff9B9B9B),
  );

  static TextStyle red({double size = 22}) => TextStyle(
    fontSize: size,
    fontWeight: FontWeight.w400,
    color: Color(0xffF00E3E),
  );
}
