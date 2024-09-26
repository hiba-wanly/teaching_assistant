import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callDepartment([Param param]);
  Future<Either<Failure, Type>> callLecturer([Param param]);
  Future<Either<Failure, Type>> callGeneralInformation([Param param]);
  Future<Either<Failure, Type>> callStudent(int sub_id, [Param param]);
}

class NoParam {}
