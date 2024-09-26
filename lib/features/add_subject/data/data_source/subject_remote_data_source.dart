import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';

abstract class SubjectRemoteDataSource {
  Future<List<Subject>> fetchAddSubject(Map<String,dynamic> data);
  Future<List<Subject>> fetchUpdateSubject(Map<String,dynamic> data  , int id);
  Future<List<Subject>> fetchDeleteSubject(int id);
}

class SubjectRemoteDataSourceImpl extends SubjectRemoteDataSource {
  final ApiService apiService;
  SubjectRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Subject>> fetchAddSubject(Map<String,dynamic> data1) async {
    var data = await apiService.post( endPoint: 'subject/', data1: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Subject> nums = getSubject(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Subject>> fetchUpdateSubject(Map<String,dynamic> data1  , int id) async {
    var data = await apiService.update( endPoint: 'subject/${id}', data: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Subject> nums = getSubject(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Subject>> fetchDeleteSubject(int id) async {
    var data = await apiService.delete( endPoint: 'subject/${id}');
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

