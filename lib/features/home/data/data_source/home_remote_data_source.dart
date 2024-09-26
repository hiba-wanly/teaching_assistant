import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<Subject>> fetchMySubjectData();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Subject>> fetchMySubjectData() async {
    var data = await apiService.get( endPoint: 'subject/');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Subject> nums = getSubject(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  List<Subject> getSubject(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Subject> nums=[];
    for(var numMap in data['data']){
      nums.add(Subject.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }
}

