import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/files/data/models/files_model.dart';
import 'package:teachers_marks/features/files/domain/repos/files_repo.dart';
import 'use_case.dart';

class FetchFilesUseCase extends UseCase<List<Files>, NoParam> {
  final FilesRepo filesRepo;
  FetchFilesUseCase(this.filesRepo);

  @override
  Future<Either<Failure, List<Files>>> callAddFiles(Map<String,dynamic> data ,  [NoParam? param]) async {
    return await filesRepo.fetchAddFiles(data);
  }
  @override
  Future<Either<Failure, List<Files>>> callGetFiles( int sub_id, [NoParam? param]) async {
    return await filesRepo.fetchGetFiles(sub_id);
  }
  @override
  Future<Either<Failure, List<Files>>> callDeleteFiles(int file_id,  [NoParam? param]) async {
    return await filesRepo.fetchDeleteFiles( file_id);
  }

  @override
  Future<Either<Failure, List<Files>>> callUpdateFiles(Map<String,dynamic> data ,int file_id,  [NoParam? param]) async {
    return await filesRepo.fetchUpdateFiles( data,file_id);
  }


}

