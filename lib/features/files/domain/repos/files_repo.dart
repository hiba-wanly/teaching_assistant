import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/files/data/models/files_model.dart';

abstract class FilesRepo {
  Future<Either<ServerFailure, List<Files>>> fetchAddFiles(Map<String,dynamic> data);
  Future<Either<ServerFailure, List<Files>>> fetchGetFiles( int sub_id);
  Future<Either<ServerFailure, List<Files>>> fetchDeleteFiles( int file_id);
  Future<Either<ServerFailure, List<Files>>> fetchUpdateFiles(Map<String,dynamic> data, int file_id);

}
