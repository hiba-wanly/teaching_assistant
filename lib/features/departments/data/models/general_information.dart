import 'package:flutter/material.dart';

class GeneralInformation{
  dynamic id;
  dynamic semester;
  dynamic year;

  GeneralInformation({
    this.id,
     this.semester,
    this.year
  });



  GeneralInformation.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    semester = json['semester'];
    year = json['year'];
  }
}