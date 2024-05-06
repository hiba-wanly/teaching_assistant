import 'dart:io';

import 'package:flutter/material.dart';

class SignUp {
  dynamic id;
  dynamic email;
  dynamic password;
  dynamic full_name;

  SignUp(
      {this.id,
      required this.email,
      required this.password,
      required this.full_name});

  Map<String, dynamic> toJson() {
    return {"email": email, "password": password, "full_name": full_name};
  }

  SignUp.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());

    email = json['email'];
    debugPrint(email.toString());

    full_name = json['email'];
    debugPrint(full_name.toString());

    password = json['password'];
  }
}
