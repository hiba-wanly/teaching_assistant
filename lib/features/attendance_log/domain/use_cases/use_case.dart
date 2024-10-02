import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callAddAttendanceLog(List<Map<String,dynamic>> data ,  [Param param]);
  // Future<Either<Failure, Type>> callGetStudentSubject(int sub_id, [Param param]);
  Future<Either<Failure, Type>> callGetStudentAttendanceLog( int att_id  ,  [Param param]);
  Future<Either<Failure, Type>> callGetAttendanceStudentLog( int stu_id  ,  int att_id  ,[Param param]);

}

class NoParam {}
