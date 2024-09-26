import 'package:flutter/material.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceFailure extends AttendanceState {
  final String errMessage;
  AttendanceFailure(this.errMessage);
}

class AttendanceSuccess extends AttendanceState {
  final List<Attendance> attendanceLab;
  final List<Attendance> attendanceTheroy;
  AttendanceSuccess(this.attendanceLab, this.attendanceTheroy);
}
