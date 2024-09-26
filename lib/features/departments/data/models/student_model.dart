import 'package:flutter/material.dart';

class Student {
  dynamic id;
  dynamic first_name;
  dynamic last_name;
  dynamic father_name;

  Student({
    this.id,
    this.first_name,
    this.last_name,
    this.father_name,
  });



  Student.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    first_name = json['first_name'];
    last_name = json['last_name'];
    father_name = json['father_name'];
  }
}