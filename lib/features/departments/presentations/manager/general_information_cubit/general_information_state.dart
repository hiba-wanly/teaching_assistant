import 'package:flutter/material.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';

@immutable
abstract class GeneralInformationState {}

class GeneralInformationInitial extends GeneralInformationState {}

class GeneralInformationLoading extends GeneralInformationState {}

class GeneralInformationFailure extends GeneralInformationState {
  final String errMessage;
  GeneralInformationFailure(this.errMessage);
}

class GeneralInformationSuccess extends GeneralInformationState {
  final GeneralInformation General_nformation;
  GeneralInformationSuccess(this.General_nformation);
}
