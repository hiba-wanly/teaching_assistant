import 'package:flutter/material.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';

@immutable
abstract class LecturerState {}

class LecturerInitial extends LecturerState {}

class LecturerLoading extends LecturerState {}

class LecturerFailure extends LecturerState {
  final String errMessage;
  LecturerFailure(this.errMessage);
}



class LecturerSuccess extends LecturerState {
  final List<Lecturer> lecturer;
  LecturerSuccess(this.lecturer);
}



