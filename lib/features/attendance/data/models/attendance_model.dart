import 'package:flutter/material.dart';

class Attendance{
  dynamic id;
  dynamic subject;
  dynamic date;
  dynamic day;
  dynamic type;

  Attendance({
    this.id,
     this.subject,
    this.date,
    this.day,
    this.type,
  });



  Attendance.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    subject = json['subject'];
    date = json['date'];
    day = json['day'];
    type = json['type'];
  }
}