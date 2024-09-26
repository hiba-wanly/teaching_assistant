import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';

abstract class DepartmentRemoteDataSource {
  Future<List<Departments>> fetchDepartmentData();
  Future<List<Lecturer>> fetchLecturerData();
  Future<GeneralInformation> fetchGeneralInformationData();
  Future<List<Student>> fetchGetStudentSubject(int sub_id);
}

class DepartmentRemoteDataSourceImpl extends DepartmentRemoteDataSource {
  final ApiService apiService;
  DepartmentRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Departments>> fetchDepartmentData() async {
    var data = await apiService.get( endPoint: 'departments/');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Departments> nums = getDepartments(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<List<Lecturer>> fetchLecturerData() async {
    var data = await apiService.get( endPoint: 'lecturer/lecturer');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Lecturer> nums = getLecturer(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<GeneralInformation> fetchGeneralInformationData() async {
    var data = await apiService.get( endPoint: 'general_information/');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    GeneralInformation nums = getGeneralInformation(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  List<Departments> getDepartments(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Departments> nums=[];
    for(var numMap in data['data']){
      nums.add(Departments.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
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

  GeneralInformation getGeneralInformation(Map<String, dynamic> data) {
    debugPrint("123456789");
    GeneralInformation nums= GeneralInformation.fromJson(data['data']);
    return nums;
  }

  @override
  Future<List<Student>> fetchGetStudentSubject(int sub_id) async {
    var data = await apiService.get( endPoint: 'subject/getStudentFromSubject/${sub_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Student> nums = getStudent(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  List<Student> getStudent(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Student> nums=[];
    for(var numMap in data['data']){
      nums.add(Student.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}

