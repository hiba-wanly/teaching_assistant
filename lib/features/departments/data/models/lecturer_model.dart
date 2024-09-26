import 'package:flutter/material.dart';

class Lecturer {
  dynamic id;
  dynamic name;

  Lecturer({
    this.id,
    required this.name,
  });



  Lecturer.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    name = json['name'];
  }
}