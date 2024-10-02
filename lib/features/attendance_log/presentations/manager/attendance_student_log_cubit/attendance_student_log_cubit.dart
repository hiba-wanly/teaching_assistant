import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_student_log_model.dart';
import 'package:teachers_marks/features/attendance_log/domain/use_cases/fetch_attendance_log_use_case.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_student_log_cubit/attendance_student_log_state.dart';

class AttendanceStudentLogCubit extends Cubit<AttendanceStudentLogState> {
  AttendanceStudentLogCubit(this.fetchAttendanceStudentLogUseCase) : super(AttendanceStudentLogInitial());

  final FetchAttendanceStudentLogUseCase fetchAttendanceStudentLogUseCase;


  late List<AttendanceStudentLog> student;
  late List<String> selectedIcons = [];

  Future<void> getAttendanceStudentLog(int stu_id, int att_id) async {
    emit(AttendanceStudentLogLoading());
    var result = await fetchAttendanceStudentLogUseCase.callGetAttendanceStudentLog(stu_id, att_id);

    result.fold((failure) {
      emit(AttendanceStudentLogFailure(failure.message));
    }, (attendanceLog) {
      updateStudent(attendanceLog);
      updateSelectedIcons(attendanceLog);
      emit(AttendanceStudentLogSuccess(attendanceLog ));
    });
  }

  void updateSelectedIcons(List<AttendanceStudentLog> attendanceLog){
    if (selectedIcons.isEmpty) {
      selectedIcons = List<String>.filled(
          attendanceLog.length, ''); // Initialize once
    }
    for (int i = 0; i < attendanceLog.length; i++) {
      var student = attendanceLog[i];
      selectedIcons[i] = student.status; // Adjust according to your model
    }
  }

  void updateStudent(List<AttendanceStudentLog> newStudent) {
    student = newStudent;
    emit(AttendanceStudentLogSuccess(student));
  }

  Iterable<int> arabicTashkelChar = [
    1617,
    124,
    1614,
    124,
    1611,
    124,
    1615,
    124,
    1612,
    124,
    1616,
    124,
    1613,
    124,
    1618,
    625,
    627,
    655,
  ];


  void filterStudents(String name) {
    // setState(() {
    print("############@@##################################");
    print(name);
    if(name.isEmpty)
    {
      debugPrint("here no name");
      print("#############student###############");
      print('Filtered $student');
      print("#############student###############");
      emit(AttendanceStudentLogSuccess(student));
      // results= _contacts ;
    }
    else {
      final filteredStudents = student
          .where((student) =>
          _normalize(student.first_name).toString().contains(_normalize(name)))
          .toList();
      emit(AttendanceStudentLogSuccess(filteredStudents));
      print("###########@query##################################");
      print(name);
      print("#############_filteredContacts###############");
      print('Filtered $filteredStudents');
      print("#############_filteredContacts###############");

    }
    // setState(() {
    //   debugPrint("##############setstateresults##############");
    //   print(results);
    //   _filteredContacts.clear();
    //   _filteredContacts = results;
    //   print(_filteredContacts);
    // });
  }
  String _normalize(String input) {
    return input
        .replaceAll('\u0622', '\u0627')
        .replaceAll('\u0623', '\u0627')
        .replaceAll('\u0625', '\u0627')
        .replaceAll(RegExp(String.fromCharCodes(arabicTashkelChar)), '');
  }
}



//
// IconButton(
// icon: Icon(Icons.check_circle,
// color: _filteredContacts[index].status ==
// 'attended' || selectedIcons[index] == 'حضور'
// ? Colors.green
//     : Colors.grey),
// onPressed: () {
// _filteredContacts[index].status !=
// '' ?
// AwesomeDialogWidget.show(
// context,
// 'هل أنت متأكد من تغير حالة الطالب ' +_filteredContacts[index].first_name ,
// () {
// setState(() {
// selectedIcons[index] = 'حضور';
// _filteredContacts[index].status =
// 'attended' ;
// });
// Map<String, dynamic> data = {
// "attendance": widget.attId,
// "student":
// _filteredContacts[index]
//     .student_id,
// "status": "attended"
// };
// bool containsData =
// sendData.any((item) =>
// item['student'] ==
// data['student']);
// if (containsData) {
// sendData.removeWhere((item) =>
// item['student'] ==
// data['student']);
// sendData.add(data);
// } else {
// sendData.add(data);
// }
// },
// ) :  setState(() {
// selectedIcons[index] = 'حضور';
// _filteredContacts[index].status =
// 'attended' ;
// Map<String, dynamic> data = {
// "attendance": widget.attId,
// "student":
// _filteredContacts[index]
//     .student_id,
// "status": "attended"
// };
// bool containsData =
// sendData.any((item) =>
// item['student'] ==
// data['student']);
// if (containsData) {
// sendData.removeWhere((item) =>
// item['student'] ==
// data['student']);
// sendData.add(data);
// } else {
// sendData.add(data);
// };
// });
//
//
// },
// ),