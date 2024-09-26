import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callLogin(Map<String, dynamic> data2,
      [Param param]);
  Future<Either<Failure, Type>> callLogout( [Param param]);
  Future<Either<Failure,Type>> callSignUp(Map<String,dynamic> data2,[Param param]);

}

class NoParam {}
