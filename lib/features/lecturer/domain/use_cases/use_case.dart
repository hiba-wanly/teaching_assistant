import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callAddLecturer(Map<String,dynamic> data ,  [Param param]);
  Future<Either<Failure, Type>> callGetLecturer(int sub_id, [Param param]);
  Future<Either<Failure, Type>> callDeleteLecturer(int sub_id , int lect_id  ,  [Param param]);
}

class NoParam {}
