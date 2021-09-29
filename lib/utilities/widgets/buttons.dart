import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWidget {
  fixedRed(label, callback, {double width = double.infinity}) {
    return MaterialButton(
      color: Color(0xffF00E3E),
      elevation: 0,
      onPressed: () {
        callback();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      height: 60,
      minWidth: width,
      child: Text(
        label.toString().toUpperCase(),
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  red(label, callback, {double width = double.infinity}) {
    return MaterialButton(
      color: Color(0xffF00E3E),
      elevation: 0,
      onPressed: () {
        callback();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 45,
      minWidth: width,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  white(label, callback, {double width = double.infinity}) {
    return MaterialButton(
      color: Colors.white,
      elevation: 0,
      onPressed: () {
        callback();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: Color(0xffF00E3E)),
      ),
      height: 45,
      minWidth: width,
      child: Text(
        label,
        style: TextStyle(color: Color(0xffF00E3E), fontSize: 14),
      ),
    );
  }

  cleanWhite(label, callback, {double width = double.infinity}) {
    return MaterialButton(
      color: Colors.white,
      elevation: 0,
      onPressed: () {
        callback();
      },
      height: 45,
      minWidth: width,
      child: Text(
        label,
        style: TextStyle(color: Color(0xffF00E3E), fontSize: 14),
      ),
    );
  }

  whiteForChat(label, callback, {double width = double.infinity}) {
    return MaterialButton(
      color: Colors.white,
      elevation: 0,
      onPressed: () {
        callback();
      },
      height: 45,
      // minWidth: width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: TextStyle(color: Color(0xffA7A7A7), fontSize: 14),
      ),
    );
  }

  blue(
    label,
    callback, {
    double width = double.infinity,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return MaterialButton(
      color: Color(0xff4087DA),
      elevation: 0,
      onPressed: () {
        callback();
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 45,
      minWidth: width,
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  icon(icon, callback) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(31, 32, 65, 0.2),
            offset: new Offset(0, 4),
            blurRadius: 5,
          )
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          callback();
        },
        child: Image.asset(
          icon,
          fit: BoxFit.contain,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  navIcon(String icon, callback, {bool active = false}) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: active ? Color.fromRGBO(242, 14, 62, 0.06) : Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: MaterialButton(
        onPressed: () {
          callback();
        },
        child: SvgPicture.asset(
          icon,
          width: 25,
          height: 25,
          fit: BoxFit.contain,
          allowDrawingOutsideViewBox: true,
          color: active ? Color(0xffF00E3E) : Color(0xff9B9BA0),
        ),
      ),
    );
  }
}
