import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';

abstract class AttendanceRemoteDataSource {
  Future<List<Attendance>> fetchAddAttendance(Map<String,dynamic> data);
  Future<List<Attendance>> fetchGetAttendance(int sub_id);
  Future<List<Attendance>> fetchDeleteAttendance( int att_id);
}

class AttendanceRemoteDataSourceImpl extends AttendanceRemoteDataSource {
  final ApiService apiService;
  AttendanceRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Attendance>> fetchAddAttendance(Map<String,dynamic> data1) async {
    var data = await apiService.post( endPoint: 'attendance/', data1: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Attendance> nums = getAttendance(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Attendance>> fetchGetAttendance( int sub_id) async {
    var data = await apiService.get( endPoint: 'attendance/subject/${sub_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Attendance> nums = getAttendance(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Attendance>> fetchDeleteAttendance( int att_id) async {
    var data = await apiService.delete( endPoint: 'attendance/${att_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Attendance> nums = getAttendance(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }


  List<Attendance> getAttendance(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Attendance> nums=[];
    for(var numMap in data['data']){
      nums.add(Attendance.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}

