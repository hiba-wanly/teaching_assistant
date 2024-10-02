import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/features/files/data/models/files_model.dart';

abstract class FilesRemoteDataSource {
  Future<List<Files>> fetchAddFiles(Map<String,dynamic> data);
  Future<List<Files>> fetchGetFiles(int sub_id);
  Future<List<Files>> fetchDeleteFiles( int file_id);
  Future<List<Files>> fetchUpdateFiles( Map<String,dynamic> data,int file_id);
}

class FilesRemoteDataSourceImpl extends FilesRemoteDataSource {
  final ApiService apiService;
  FilesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<Files>> fetchAddFiles(Map<String,dynamic> data1) async {
    var data = await apiService.post( endPoint: 'files/', data1: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Files> nums = getFiles(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Files>> fetchGetFiles( int sub_id) async {
    var data = await apiService.get( endPoint: 'files/subject/${sub_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Files> nums = getFiles(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Files>> fetchDeleteFiles( int file_id) async {
    var data = await apiService.delete( endPoint: 'files/${file_id}');
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Files> nums = getFiles(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  @override
  Future<List<Files>> fetchUpdateFiles(Map<String,dynamic> data1,int file_id) async {
    var data = await apiService.update( endPoint: 'files/${file_id}', data: data1);
    debugPrint("WEAREHERE12121212121222");
    debugPrint(data.toString());
    List<Files> nums = getFiles(data);
    debugPrint("WEAREHERE");
    debugPrint(nums.toString());
    return nums;
  }
  List<Files> getFiles(Map<String, dynamic> data) {
    debugPrint("123456789");
    List<Files> nums=[];
    for(var numMap in data['data']){
      nums.add(Files.fromJson(numMap));
    }
    debugPrint("HRHRRTTTTTTTT");
    debugPrint(nums.toString());
    return nums;
  }

}

