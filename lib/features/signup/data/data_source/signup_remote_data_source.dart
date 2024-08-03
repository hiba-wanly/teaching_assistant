import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/signup/data/models/signup_model.dart';

abstract class SignupRemoteDataSource {
  Future<SignUp> fetchSignupData(Map<String, dynamic> data2);
  Future logoutUser(dynamic id);
}

class SignupRemoteDataSourceImpl extends SignupRemoteDataSource {
  final ApiService apiService;
  SignupRemoteDataSourceImpl(this.apiService);

  @override
  Future<SignUp> fetchSignupData(Map<String, dynamic> data2) async {
    var data = await apiService.post(data1: data2, endPoint: 'lecturer/register');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    SignUp nums = getSignup(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future logoutUser(dynamic id) async {}

  SignUp getSignup(Map<String, dynamic> data) {
    debugPrint("123456789");
    SignUp nums = SignUp.fromJson(data['data']);
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}
