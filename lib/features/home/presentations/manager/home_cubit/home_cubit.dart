import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/home/domain/use_cases/fetch_home_use_case.dart';
import 'package:teachers_marks/features/home/presentations/manager/home_cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      this.fetchHomeUseCase,
  //     {
  // required this.subject,
  // }
  ) : super(HomeInitial());

  final FetchHomeUseCase fetchHomeUseCase;
  late List<Subject> subject;

  Future<List<Subject>?> fetchMySubjectData() async {
    emit(HomeLoading());

    var result = await fetchHomeUseCase.callMySubject();

    result.fold((failure) {
      emit(HomeFailure(failure.message));
    }, (subject) {
      emit(HomeSuccess(subject));
    });
  }




  void updateSubject(List<Subject> newsubject) {
    subject = newsubject;
    emit(HomeSuccess(subject));
  }


}
