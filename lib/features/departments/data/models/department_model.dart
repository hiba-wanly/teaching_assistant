import 'dart:io';

import 'package:flutter/material.dart';

class Departments {
  dynamic id;
  dynamic name;

  Departments({
    this.id,
    required this.name,
  });



  Departments.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    name = json['name'];
  }
}
