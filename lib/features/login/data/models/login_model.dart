import 'dart:io';

import 'package:flutter/material.dart';

class Login {
  dynamic id;
  dynamic email;
  dynamic password;

  Login({
    this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }

  Login.fromJson(Map<String, dynamic> json) {
    debugPrint("11111112222222222222233333");
    id = json['id'];
    debugPrint(id.toString());
    email = json['email'];
    debugPrint(email.toString());
  }
}
