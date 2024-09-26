import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';
import 'package:teachers_marks/features/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_state.dart';

class StudentCubit extends Cubit<StudentState> {
  StudentCubit(this.fetchStudentUseCase

  ) : super(StudentInitial());

  final FetchStudentUseCase fetchStudentUseCase;
  late List<Student> student;



  Future<List<Student>?> getStudentData(int sub_id) async {
    emit(StudentLoading());

    var result = await fetchStudentUseCase.callStudent(sub_id);

    result.fold((failure) {
      emit(StudentFailure(failure.message));
    }, (student) {
      emit(StudentSuccess(student));
      return student;
    });
  }

  // Method to update lecturer
  void updateStudent(List<Student> newStudent) {
    student = newStudent;
    emit(StudentSuccess(student));
  }

}
