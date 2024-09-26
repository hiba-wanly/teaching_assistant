import 'package:flutter/material.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';

@immutable
abstract class DepartmentState {}

class DepartmentInitial extends DepartmentState {}

class DepartmentLoading extends DepartmentState {}

class DepartmentFailure extends DepartmentState {
  final String errMessage;
  DepartmentFailure(this.errMessage);
}

class DepartmentSuccess extends DepartmentState {
  final List<Departments> departments;
  DepartmentSuccess(this.departments);
}

