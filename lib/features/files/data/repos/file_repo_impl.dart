import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/files/data/data_source/files_remote_data_source.dart';
import 'package:teachers_marks/features/files/data/models/files_model.dart';
import 'package:teachers_marks/features/files/domain/repos/files_repo.dart';

class FilesRepoImpl extends FilesRepo {
  final FilesRemoteDataSource filesRemoteDataSource;

  FilesRepoImpl({
    required this.filesRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Files>>> fetchAddFiles(Map<String,dynamic> data) async {
    try {
      debugPrint("KKKHEREERER");
      List<Files> nums;
      nums = await filesRemoteDataSource.fetchAddFiles(data);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure.fromDioError(e));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }


  @override
  Future<Either<ServerFailure, List<Files>>> fetchGetFiles(int sub_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Files> nums;
      nums = await filesRemoteDataSource.fetchGetFiles( sub_id);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure.fromDioError(e));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<Files>>> fetchDeleteFiles( int file_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Files> nums;
      nums = await filesRemoteDataSource.fetchDeleteFiles( file_id );
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure.fromDioError(e));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, List<Files>>> fetchUpdateFiles(Map<String,dynamic> data , int file_id)async {
    try {
      debugPrint("KKKHEREERER");
      List<Files> nums;
      nums = await filesRemoteDataSource.fetchUpdateFiles(data, file_id);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure.fromDioError(e));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
