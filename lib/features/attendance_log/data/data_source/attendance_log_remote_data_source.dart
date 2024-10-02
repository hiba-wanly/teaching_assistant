import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_student_log_model.dart';

abstract class AttendanceLogRemoteDataSource {
  Future<String> fetchAddAttendanceLog(List<Map<String,dynamic>> data);
  // Future<List<AttendanceLog>> fetchGetStudentSubject(int sub_id);
  Future<List<AttendanceLog>> fetchGetStudentAttendanceLog( int att_id);
  Future<List<AttendanceStudentLog>> fetchGetAttendanceStudentLog( int sub_id,int att_id);
}

class AttendanceLogRemoteDataSourceImpl extends AttendanceLogRemoteDataSource {
  final ApiService apiService;
  AttendanceLogRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> fetchAddAttendanceLog(List<Map<String,dynamic>> data1) async {
    var data = await apiService.postList( endPoint: 'attendance/log', data1: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    String nums = getAttendanceLogString(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }

  @override
  Future<List<AttendanceStudentLog>> fetchGetAttendanceStudentLog( int sub_id,int att_id) async {
    var data = await apiService.get( endPoint: 'attendance/subject/student/${sub_id}/${att_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<AttendanceStudentLog> nums = getAttendanceStudentLog(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<AttendanceLog>> fetchGetStudentAttendanceLog( int att_id) async {
    var data = await apiService.get( endPoint: 'attendance/log/${att_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<AttendanceLog> nums = getAttendanceLog(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }


  List<AttendanceLog> getAttendanceLog(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<AttendanceLog> nums=[];
    for(var numMap in data['data']){
      nums.add(AttendanceLog.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

  String getAttendanceLogString(Map<String, dynamic> data) {
    debugPrint("123456789");
    String nums= data['message'];
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }


  List<AttendanceStudentLog> getAttendanceStudentLog(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<AttendanceStudentLog> nums=[];
    for(var numMap in data['data']){
      nums.add(AttendanceStudentLog.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}

