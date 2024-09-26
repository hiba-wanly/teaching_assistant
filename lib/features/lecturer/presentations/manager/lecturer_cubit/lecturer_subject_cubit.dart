import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/features/lecturer/domain/use_cases/fetch_lecturer_use_case.dart';
import 'package:teachers_marks/features/lecturer/presentations/manager/lecturer_cubit/lecturer_subject_state.dart';

class LecturerSubjectCubit extends Cubit<LecturerSubjectState> {
  LecturerSubjectCubit(this.fetchLecturerSubjectUseCase) : super(LecturerSubjectInitial());

  final FetchLecturerSubjectUseCase fetchLecturerSubjectUseCase;


  Future<void> addLecturer(Map<String, dynamic> data) async {
    emit(LecturerSubjectLoading());
    debugPrint(data.toString());
    var result = await fetchLecturerSubjectUseCase.callAddLecturer(data);

    result.fold((failure) {
      emit(LecturerSubjectFailure(failure.message));
    }, (lecturer) {
      emit(LecturerSubjectSuccess(lecturer));
    });
  }

  Future<void> getLecturer( int sub_id) async {
    emit(LecturerSubjectLoading());
    var result = await fetchLecturerSubjectUseCase.callGetLecturer( sub_id);

    result.fold((failure) {
      emit(LecturerSubjectFailure(failure.message));
    }, (lecturer) {
      emit(LecturerSubjectSuccess(lecturer));
    });
  }

  Future<void> deleteLecturer(int sub_id , int lect_id) async {
    emit(LecturerSubjectLoading());
    var result = await fetchLecturerSubjectUseCase.callDeleteLecturer(sub_id,lect_id);

    result.fold((failure) {
      emit(LecturerSubjectFailure(failure.message));
    }, (subject) {
      emit(LecturerSubjectSuccess(subject));
    });
  }


}
