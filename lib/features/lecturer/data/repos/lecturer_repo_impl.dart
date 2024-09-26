import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/lecturer/data/data_source/lecturer_remote_data_source.dart';
import 'package:teachers_marks/features/lecturer/domain/repos/lecturer_repo.dart';

class LecturerRepoImpl extends LecturerRepo {
  final LecturerRemoteDataSource lecturerRemoteDataSource;

  LecturerRepoImpl({
    required this.lecturerRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Lecturer>>> fetchAddLecturer(Map<String,dynamic> data) async {
    try {
      debugPrint("KKKHEREERER");
      List<Lecturer> nums;
      nums = await lecturerRemoteDataSource.fetchAddLecturer(data);
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
  Future<Either<ServerFailure, List<Lecturer>>> fetchGetLecturer(int sub_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Lecturer> nums;
      nums = await lecturerRemoteDataSource.fetchGetLecturer( sub_id);
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
  Future<Either<ServerFailure, List<Lecturer>>> fetchDeleteLecturer(int sub_id, int lect_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Lecturer> nums;
      nums = await lecturerRemoteDataSource.fetchDeleteLecturer( sub_id, lect_id );
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
