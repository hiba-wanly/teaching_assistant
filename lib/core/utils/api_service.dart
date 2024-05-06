import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class ApiService {
  final Dio _dio;
  final baseUrl = 'http://192.168.1.110:8000/';
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint, required Map<String,dynamic> data1}) async {
    FormData data2 = FormData.fromMap(data1);
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data2,
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> update({required String endPoint, required Map<String,dynamic> data}) async {
    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data,
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    var response = await _dio.delete(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
      }),
    );
    return response.data;
  }



}