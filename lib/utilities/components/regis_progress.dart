import 'package:flutter/material.dart';

regisProgress(step) {
  return Builder(
    builder: (BuildContext context) {
      double _width = MediaQuery.of(context).size.width / 4;
      return Column(
        children: [
          Row(
            children: <Widget>[
              for (var idx in [1, 2, 3, 4])
                Container(
                  width: _width,
                  height: 3,
                  color: step < idx
                      ? Color.fromRGBO(240, 14, 62, 0.0)
                      : step > idx
                          ? Color(0xffF00E3E)
                          : Color.fromRGBO(240, 14, 62, 0.5),
                ),
            ],
          ),
        ],
      );
    },
  );
}
