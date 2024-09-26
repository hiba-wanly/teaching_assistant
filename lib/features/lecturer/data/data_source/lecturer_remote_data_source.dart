import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';

abstract class LecturerRemoteDataSource {
  Future<List<Lecturer>> fetchAddLecturer(Map<String,dynamic> data);
  Future<List<Lecturer>> fetchGetLecturer(int sub_id);
  Future<List<Lecturer>> fetchDeleteLecturer(int sub_id , int lect_id);
}

class LecturerRemoteDataSourceImpl extends LecturerRemoteDataSource {
  final ApiService apiService;
  LecturerRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Lecturer>> fetchAddLecturer(Map<String,dynamic> data1) async {
    var data = await apiService.post( endPoint: 'subject/addlecturertosubject', data1: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Lecturer> nums = getLecturer(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Lecturer>> fetchGetLecturer( int sub_id) async {
    var data = await apiService.get( endPoint: 'subject/getLecturerFromSubject/${sub_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Lecturer> nums = getLecturer(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Lecturer>> fetchDeleteLecturer(int sub_id, int lect_id) async {
    var data = await apiService.delete( endPoint: 'subject/deleteLecturerFromSubject/${sub_id}/${lect_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Lecturer> nums = getLecturer(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }


  List<Lecturer> getLecturer(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Lecturer> nums=[];
    for(var numMap in data['data']){
      nums.add(Lecturer.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}

