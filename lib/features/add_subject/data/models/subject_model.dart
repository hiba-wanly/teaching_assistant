import 'dart:io';

import 'package:flutter/material.dart';

class Subject {
  dynamic id;
  dynamic subject_name;
  dynamic academic_year;
  dynamic departments;
  dynamic semester;
  dynamic year;
  dynamic tests_mark;
  dynamic attendance_mark;
  dynamic interviews_mark;
  dynamic homework_mark;
  dynamic labs_mark;

  Subject({
    this.id,
     this.subject_name,
    this.academic_year,
    this.departments,
    this.semester,
    this.year,
    this.tests_mark,
    this.attendance_mark,
    this.interviews_mark,
    this.homework_mark,
    this.labs_mark,
  });


  Map<String, dynamic> toJson() {
    return {
      "subject_name": subject_name,
      "academic_year": academic_year,
      "departments": departments,
      "tests_mark": tests_mark,
      "attendance_mark": attendance_mark,
      "interviews_mark": interviews_mark,
      "homework_mark": homework_mark,
      "labs_mark": labs_mark,
    };
  }

  Subject.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    subject_name = json['subject_name'];
    academic_year = json['academic_year'];
    departments = json['departments'];
    semester = json['semester'];
    year = json['year'];
    tests_mark = json['tests_mark'];
    attendance_mark = json['attendance_mark'];
    interviews_mark = json['interviews_mark'];
    homework_mark = json['homework_mark'];
    labs_mark = json['labs_mark'];


  }
}
