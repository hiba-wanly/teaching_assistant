import 'dart:io';

import 'package:flutter/material.dart';

class Login {
  dynamic id;
  dynamic email;
  dynamic username;
  dynamic password;
  dynamic full_name;
  dynamic lecturer_id;

  Login({
    this.id,
    required this.username,
    required this.password,

    this.lecturer_id,
     this.email,
     this.full_name
  });

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }

  Login.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['user_id'];
    lecturer_id = json['lecturer_id'];
    debugPrint(id.toString());

    email = json['email'];
    debugPrint(email.toString());

    full_name = json['name'];
    debugPrint(full_name.toString());
    username = json['username'];
    password = json['password'];
  }
}
