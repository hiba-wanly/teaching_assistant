import 'package:flutter/material.dart';

class AttendanceStudentLog{

  dynamic student_id;
  dynamic first_name;
  dynamic last_name;
  dynamic father_name;
  dynamic status;
  dynamic attendance_log_id;

  AttendanceStudentLog({
  this.student_id,
  this.first_name,
  this.last_name,
  this.father_name,
  this.attendance_log_id,
  this.status
  });


  AttendanceStudentLog.fromJson(Map<String, dynamic> json) {
  debugPrint("11111112222222222222233333");
  student_id = json['student_id'];
  first_name = json['first_name'];
  last_name = json['last_name'];
  father_name = json['father_name'];
  attendance_log_id = json['attendance_log_id'];
  status = json['status'];
  }
}