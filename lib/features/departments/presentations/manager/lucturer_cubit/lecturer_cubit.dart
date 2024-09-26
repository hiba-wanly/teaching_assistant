import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:teachers_marks/features/departments/presentations/manager/lucturer_cubit/lucturer_state.dart';

class LecturerCubit extends Cubit<LecturerState> {
  LecturerCubit(this.fetchLecturerUseCase

  ) : super(LecturerInitial());

  final FetchLecturerUseCase fetchLecturerUseCase;
  late List<Lecturer> lecturer;



  Future<List<Lecturer>?> fetchLecturerData() async {
    emit(LecturerLoading());

    var result = await fetchLecturerUseCase.callLecturer();

    result.fold((failure) {
      emit(LecturerFailure(failure.message));
    }, (lecturer) {
      emit(LecturerSuccess(lecturer));
      return lecturer;
    });
  }

  // Method to update lecturer
  void updateLecturer(List<Lecturer> newLecturers) {
    lecturer = newLecturers;
    emit(LecturerSuccess(lecturer));
  }

}
