import 'package:flutter/material.dart';
import 'package:teachers_marks/features/signup/data/models/signup_model.dart';

@immutable
abstract class SignupState{}

class SignupInitial extends SignupState{}

class SignupLoading extends SignupState{}

class SignupFailure extends SignupState{
  final String errMessage;
  SignupFailure(this.errMessage);
}

class SignupSuccess extends SignupState{
  final SignUp signup;
  SignupSuccess(this.signup);
}