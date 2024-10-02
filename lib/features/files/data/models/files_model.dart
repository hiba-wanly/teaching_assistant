import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';

class Files{
  dynamic id;
  dynamic name;
  late File? file ;
  String? file_path;
  dynamic published_date;
  dynamic available_date;
  dynamic type;
  dynamic subject;

  Files({
    this.id,
     this.name,
     this.file,
    this.published_date,
    this.available_date,
    this.type,
    this.subject,
  });

  Future<Map<String, dynamic>>toJson() async {
    return {
      'name': name,
      'file_path' :await MultipartFile.fromFile(file!.path),
      'available_date' : available_date,
      'published_date' : published_date,
      'type' : type,
      'subject' : subject,
    };
  }



  Files.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    name = json['name'];
    file_path = serverApi  + json['file_path'];
    available_date = json['available_date'];
    published_date = json['published_date'];
    type = json['type'];
    subject = json['subject'];
  }
}