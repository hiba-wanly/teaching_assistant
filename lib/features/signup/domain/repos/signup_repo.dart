import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/signup/data/models/signup_model.dart';

abstract class SignupRepo {
  Future<Either<ServerFailure, SignUp>> fetchSignupData(
      Map<String, dynamic> data2);
  Future<Either<ServerFailure, SignUp>> logoutUser(dynamic id);
}
