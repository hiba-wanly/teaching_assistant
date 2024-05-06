import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/login/data/models/login_model.dart';

abstract class LoginRepo {
  Future<Either<ServerFailure, Login>> fetchLoginData(
      Map<String, dynamic> data2);
  Future<Either<ServerFailure, Login>> logoutUser(dynamic id);
}
