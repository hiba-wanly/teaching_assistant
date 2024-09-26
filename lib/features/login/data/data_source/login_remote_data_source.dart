import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/core/utils/auth_api.dart';
import 'package:teachers_marks/features/login/data/models/login_model.dart';

abstract class LoginRemoteDataSource {
  Future<Login> fetchLoginData(Map<String, dynamic> data2);
  Future<Login> fetchSignupData(Map<String, dynamic> data2);
  Future logoutUser();
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final ApiService apiService;
  LoginRemoteDataSourceImpl(this.apiService);

  ApiLog apiLog = ApiLog();

  @override
  Future<Login> fetchLoginData(Map<String, dynamic> data2) async {
    var data = await apiLog.postLR(data1: data2, endPoint: 'lecturer/login');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Login nums = getLogin(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future logoutUser() async {
    var data = await apiLog.postLogout(endPoint: 'lecturer/logout');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Login nums = getLogin(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }



  @override
  Future<Login> fetchSignupData(Map<String, dynamic> data2) async {
    var data = await apiLog.postLR(data1: data2, endPoint: 'lecturer/register');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    Login nums = getLogin(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }


  Login getLogin(Map<String, dynamic> data) {
    debugPrint("123456789");
    Login nums = Login.fromJson(data['user']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}

