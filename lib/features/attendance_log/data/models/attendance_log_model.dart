import 'package:flutter/material.dart';

class AttendanceLog{
  dynamic id;
  dynamic attendance_id;
  dynamic student_id;
  dynamic status;

  AttendanceLog({
    this.id,
     this.attendance_id,
    this.student_id,
    this.status,
  });



  AttendanceLog.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    attendance_id = json['attendance'];
    student_id = json['student'];
    status = json['status'];
  }
}