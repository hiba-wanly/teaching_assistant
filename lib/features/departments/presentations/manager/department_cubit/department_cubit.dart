import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:teachers_marks/features/departments/presentations/manager/department_cubit/department_state.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  DepartmentCubit(this.fetchDepartmentUseCase,
  // {
  // required this.department,
  //   required this.lecturer,
    // required this.generalInformation,
  // }
  ) : super(DepartmentInitial());

  final FetchDepartmentUseCase fetchDepartmentUseCase;
  late List<Departments> department;


  Future<List<Departments>?> fetchDepartmentData() async {
    emit(DepartmentLoading());

    var result = await fetchDepartmentUseCase.callDepartment();

    result.fold((failure) {
      emit(DepartmentFailure(failure.message));
    }, (department) {
      emit(DepartmentSuccess(department));
    });
  }




  void updateDepartment(List<Departments> newDepartments) {
    department = newDepartments;
    emit(DepartmentSuccess(department));
  }


}
