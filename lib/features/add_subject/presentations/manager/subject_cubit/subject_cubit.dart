import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/domain/use_cases/fetch_subject_use_case.dart';
import 'package:teachers_marks/features/add_subject/presentations/manager/subject_cubit/subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.fetchSubjectUseCase) : super(SubjectInitial());

  final FetchSubjectUseCase fetchSubjectUseCase;


  Future<void> addSubject(Subject subject) async {
    emit(SubjectLoading());
    Map<String, dynamic> data = subject.toJson();
    debugPrint(data.toString());
    var result = await fetchSubjectUseCase.callAddSubject(data);

    result.fold((failure) {
      emit(SubjectFailure(failure.message));
    }, (subject) {
      emit(SubjectSuccess(subject));
    });
  }

  Future<void> updateSubject(Subject subject , int id) async {
    emit(SubjectLoading());
    Map<String, dynamic> data = subject.toJson();
    var result = await fetchSubjectUseCase.callUpdateSubject(data , id);

    result.fold((failure) {
      emit(SubjectFailure(failure.message));
    }, (subject) {
      emit(SubjectSuccess(subject));
    });
  }

  Future<void> deleteSubject(int id ) async {
    emit(SubjectDeleteLoading());
    var result = await fetchSubjectUseCase.callDeleteSubject(id);

    result.fold((failure) {
      emit(SubjectFailure(failure.message));
    }, (subject) {
      emit(SubjectSuccess(subject));
    });
  }


}
