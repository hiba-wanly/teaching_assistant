import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callAddAttendance(Map<String,dynamic> data ,  [Param param]);
  Future<Either<Failure, Type>> callGetAttendance(int sub_id, [Param param]);
  Future<Either<Failure, Type>> callDeleteAttendance( int att_id  ,  [Param param]);
}

class NoParam {}
