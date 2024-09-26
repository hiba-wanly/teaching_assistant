import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/features/attendance_log/domain/use_cases/fetch_attendance_log_use_case.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_cubit/attendance_log_state.dart';

class AttendanceLogCubit extends Cubit<AttendanceLogState> {
  AttendanceLogCubit(this.fetchAttendanceLogUseCase, this.fetchAttendanceLogStringUseCase) : super(AttendanceLogInitial());

  final FetchAttendanceLogUseCase fetchAttendanceLogUseCase;
  final FetchAttendanceLogStringUseCase fetchAttendanceLogStringUseCase;

  Future<void> addStudentAttendanceLog(List<Map<String, dynamic>> data) async {
    emit(AttendanceLogLoading());
    debugPrint(data.toString());
    var result = await fetchAttendanceLogStringUseCase.callAddAttendanceLog(data);

    result.fold((failure) {
      emit(AttendanceLogFailure(failure.message));
    }, (attendanceLog) {
      emit(AttendanceLogStringSuccess(attendanceLog ));
    });
  }

  Future<void> getStudentAttendanceLog( int att_id) async {
    emit(AttendanceLogLoading());
    var result = await fetchAttendanceLogUseCase.callGetStudentAttendanceLog( att_id);

    result.fold((failure) {
      emit(AttendanceLogFailure(failure.message));
    }, (attendanceLog) {
      emit(AttendanceLogSuccess(attendanceLog ));    });
  }

  // Future<void> getStudentSubject( int sub_id) async {
  //   emit(AttendanceLogLoading());
  //   var result = await fetchAttendanceLogUseCase.callGetStudentSubject(sub_id);
  //
  //   result.fold((failure) {
  //     emit(AttendanceLogFailure(failure.message));
  //   }, (attendanceLog) {
  //
  //     emit(AttendanceLogSuccess(attendanceLog ));    });
  // }




}
