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
      updateData();
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
      updateData();
      emit(LoginSuccess(signup));
    });
  }

  updateData() async {
  String? user_idS =
  (await SharedPreferences.getInstance()).getString("user_id");
  String? lecturer_idS =
  (await SharedPreferences.getInstance()).getString("lecturer_id");
  String? userNameS =
  (await SharedPreferences.getInstance()).getString("userName");
  String? nameS = (await SharedPreferences.getInstance()).getString("name");
  String? emailS = (await SharedPreferences.getInstance()).getString("email");

   user_id= user_idS!;
 lecturer_id= lecturer_idS!;
   userName = userNameS!;
   name = nameS!;
   email = emailS!;
}
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("user_id");
    await prefs.remove("lecturer_id");
    await prefs.remove("userName");
    await prefs.remove("name");
    await prefs.remove("email");

    // Removes the token
  }

}
