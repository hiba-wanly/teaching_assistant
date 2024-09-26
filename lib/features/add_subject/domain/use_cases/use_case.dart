import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callAddSubject(Map<String,dynamic> data ,  [Param param]);
  Future<Either<Failure, Type>> callUpdateSubject(Map<String,dynamic> data , int id, [Param param]);
  Future<Either<Failure, Type>> callDeleteSubject(int id  ,  [Param param]);
}

class NoParam {}
