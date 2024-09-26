import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachers_marks/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.fetchLoginUseCase,{
    required this.isLoggedIn,
    required this.user_id,
    required this.lecturer_id,
    required this.userName,
    required this.name,
    required this.email,
  }) : super(LoginInitial());

  final FetchLoginUseCase fetchLoginUseCase;

  late bool isLoggedIn;
  late String user_id;
  late String lecturer_id;
  late String userName;
  late String name;
  late String email;

  Future<void> fetchLoginData(Map<String, dynamic> data) async {
    emit(LoginLoading());

    var result = await fetchLoginUseCase.callLogin(data);

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (login) {
      emit(LoginSuccess(login));
    });
  }

  Future<void> logout() async {
    emit(LoginLoading());
    var result = await fetchLoginUseCase.callLogout();

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (login) {
      isLoggedIn = false;
      removeToken();
      emit(LoginSuccess(login));
    });
  }

  Future<void> fetchSignupData(Map<String, dynamic> data) async {
    emit(LoginLoading());

    var result = await fetchLoginUseCase.callSignUp(data);

    result.fold((failure) {
      emit(LoginFailure(failure.message));
    }, (signup) {
      emit(LoginSuccess(signup));
    });
  }

  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token"); // Removes the token
  }

}
