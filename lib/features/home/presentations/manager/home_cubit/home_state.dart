import 'package:flutter/material.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailure extends HomeState {
  final String errMessage;
  HomeFailure(this.errMessage);
}

class HomeSuccess extends HomeState {
  final List<Subject> subject;
  HomeSuccess(this.subject);
}

