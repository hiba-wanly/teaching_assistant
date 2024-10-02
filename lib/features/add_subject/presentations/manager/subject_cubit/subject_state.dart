import 'package:flutter/material.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';

@immutable
abstract class SubjectState {}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectDeleteLoading extends SubjectState {}

class SubjectFailure extends SubjectState {
  final String errMessage;
  SubjectFailure(this.errMessage);
}

class SubjectSuccess extends SubjectState {
  final List<Subject> subject;
  SubjectSuccess(this.subject);
}
