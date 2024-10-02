import 'package:flutter/material.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_student_log_model.dart';


@immutable
abstract class AttendanceStudentLogState {}

class AttendanceStudentLogInitial extends AttendanceStudentLogState {}

class AttendanceStudentLogLoading extends AttendanceStudentLogState {}

class AttendanceStudentLogFailure extends AttendanceStudentLogState {
  final String errMessage;
  AttendanceStudentLogFailure(this.errMessage);
}

class AttendanceStudentLogSuccess extends AttendanceStudentLogState {
  final List<AttendanceStudentLog> attendanceLog;
  AttendanceStudentLogSuccess(this.attendanceLog);
}

