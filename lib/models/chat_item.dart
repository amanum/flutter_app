import 'dart:convert';

import 'package:quick_pick/models/employer.dart';

class MessageItem {
  MessageItem({
    this.id,
    this.message,
    this.sender,
    this.date
  });

  int? id;
  String? message;
  Employer? sender;
  String? date;

  factory MessageItem.fromJson(String str) => MessageItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageItem.fromMap(Map<String, dynamic> json) => MessageItem(
    id: json["id"] == null ? null : json["id"],
    message: json["name"] == null ? null : json["name"],
    sender: json["name"] == null ? Employer(id: 0, image: '', name: '', logo: '') : Employer.fromMap(json["sender"]),
    date: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "message": message == null ? null : message,
    "sender": sender == null ? null : sender!.toMap(),
    "date": date == null ? null : date,
  };
}