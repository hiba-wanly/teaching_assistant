import 'package:flutter/material.dart';
import 'package:teachers_marks/features/files/data/models/files_model.dart';

@immutable
abstract class FilesState {}

class FilesInitial extends FilesState {}

class FilesLoading extends FilesState {}

class FilesDeleteLoading extends FilesState {}

class FilesFailure extends FilesState {
  final String errMessage;
  FilesFailure(this.errMessage);
}

class FilesSuccess extends FilesState {
  final List<Files> filesLab;
  final List<Files> filesTheroy;
  final List<Files> filesHomeWork;
  FilesSuccess(this.filesLab, this.filesTheroy,this.filesHomeWork);
}
