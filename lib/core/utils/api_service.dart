import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachers_marks/constants.dart';
class ApiService {
  final Dio _dio;
  final baseUrl = serverApi;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.get(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({required String endPoint, required Map<String,dynamic> data1}) async {
    FormData data2 = FormData.fromMap(data1);
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: data2,
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> postList({required String endPoint, required List<Map<String,dynamic>> data1}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.post(
      '$baseUrl$endPoint',
      data: {"items":data1},
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    debugPrint("M##");
    debugPrint(response.toString());
    return response.data;
  }

  Future<Map<String, dynamic>> update({required String endPoint, required Map<String,dynamic> data}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("token");
    FormData data2 = FormData.fromMap(data);
    var response = await _dio.put(
      '$baseUrl$endPoint',
      data: data2,
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    return response.data;
  }

  Future<Map<String, dynamic>> delete({required String endPoint}) async {
    String? token =
    (await SharedPreferences.getInstance()).getString("token");

    var response = await _dio.delete(
      '$baseUrl$endPoint',
      options: Options(headers: {
        'Accept': 'application/json',
        'Authorization': 'Token ' + token!
      }),
    );
    return response.data;
  }



}