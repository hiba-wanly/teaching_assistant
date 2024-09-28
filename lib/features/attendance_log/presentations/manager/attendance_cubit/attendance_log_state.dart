import 'package:flutter/material.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';


@immutable
abstract class AttendanceLogState {}

class AttendanceLogInitial extends AttendanceLogState {}

class AttendanceLogLoading extends AttendanceLogState {}

class AttendanceLogFailure extends AttendanceLogState {
  final String errMessage;
  AttendanceLogFailure(this.errMessage);
}

class AttendanceLogSuccess extends AttendanceLogState {
  final List<AttendanceLog> attendanceLog;
  AttendanceLogSuccess(this.attendanceLog);
}


class AttendanceLogStringSuccess extends AttendanceLogState {
  final String attendanceLog;
  AttendanceLogStringSuccess(this.attendanceLog);
}