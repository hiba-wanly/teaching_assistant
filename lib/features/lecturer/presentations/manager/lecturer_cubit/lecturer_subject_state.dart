import 'package:flutter/material.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';

@immutable
abstract class LecturerSubjectState {}

class LecturerSubjectInitial extends LecturerSubjectState {}

class LecturerSubjectLoading extends LecturerSubjectState {}

class LecturerSubjectFailure extends LecturerSubjectState {
  final String errMessage;
  LecturerSubjectFailure(this.errMessage);
}

class LecturerSubjectSuccess extends LecturerSubjectState {
  final List<Lecturer> lecturerS;
  LecturerSubjectSuccess(this.lecturerS);
}
