import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
TitleBack(title, callback) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          callback();
        },
        icon: Icon(Icons.arrow_back),
      ),
      Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
