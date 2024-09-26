import 'package:flutter/material.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentFailure extends StudentState {
  final String errMessage;
  StudentFailure(this.errMessage);
}



class StudentSuccess extends StudentState {
  final List<Student> student;
  StudentSuccess(this.student);
}


