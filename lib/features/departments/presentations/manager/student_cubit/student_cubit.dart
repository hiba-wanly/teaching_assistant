import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';
import 'package:teachers_marks/features/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this.fetchStudentUseCase

  ) : super(StudentInitial());

  final FetchStudentUseCase fetchStudentUseCase;
  late List<Student> student;



  Future<List<Student>?> getStudentData(int sub_id) async {
    emit(StudentLoading());

    var result = await fetchStudentUseCase.callStudent(sub_id);

    result.fold((failure) {
      emit(StudentFailure(failure.message));
    }, (student) {
      updateStudent(student);
      emit(StudentSuccess(student));
      return student;
    });
  }

  // Method to update lecturer
  void updateStudent(List<Student> newStudent) {
    student = newStudent;
    emit(StudentSuccess(student));
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
      emit(StudentSuccess(student));
      // results= _contacts ;
    }
    else {
     final filteredStudents = student
          .where((student) =>
          _normalize(student.first_name).toString().contains(_normalize(name)))
          .toList();
     emit(StudentSuccess(filteredStudents));
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
