import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:teachers_marks/features/departments/presentations/manager/general_information_cubit/general_information_state.dart';

class GeneralInformationCubit extends Cubit<GeneralInformationState> {
  GeneralInformationCubit(this.fetchGeneralInformationUseCase,

  ) : super(GeneralInformationInitial());

  final FetchGeneralInformationUseCase fetchGeneralInformationUseCase;

  late GeneralInformation generalInformation;


  Future<GeneralInformation?> fetchGeneralInformationData() async {
    emit(GeneralInformationLoading());

    var result = await fetchGeneralInformationUseCase.callGeneralInformation();

    result.fold((failure) {
      emit(GeneralInformationFailure(failure.message));
    }, (general_information) {
      // generalInformation = general_information;
      emit(GeneralInformationSuccess(general_information));
      return general_information;
    });
  }



  // Method to update general information
  void updateGeneralInformation(GeneralInformation newGeneralInformation) {
    generalInformation = newGeneralInformation;
    emit(GeneralInformationSuccess(generalInformation));
  }
}
