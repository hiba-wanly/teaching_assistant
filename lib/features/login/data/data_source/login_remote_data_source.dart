import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<Login> fetchLoginData(Map<String, dynamic> data2);
  Future logoutUser(dynamic id);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;
  LoginRemoteDataSourceImpl(this.apiService);

  @override
  Future<Login> fetchLoginData(Map<String, dynamic> data2) async {
    var data = await apiService.post(data1: data2, endPoint: 'auth/login/');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Login nums = getLogin(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future logoutUser(dynamic id) async {
    // deleteLoginData(kLoginBox);
  }

  Login getLogin(Map<String, dynamic> data) {
    debugPrint("123456789");
    Login nums = Login.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
