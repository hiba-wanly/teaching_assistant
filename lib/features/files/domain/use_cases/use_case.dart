import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> callAddFiles(Map<String,dynamic> data ,  [Param param]);
  Future<Either<Failure, Type>> callGetFiles(int sub_id, [Param param]);
  Future<Either<Failure, Type>> callDeleteFiles( int file_id  ,  [Param param]);
  Future<Either<Failure, Type>> callUpdateFiles(Map<String,dynamic> data ,  int file_id ,[Param param]);
}

class NoParam {}
