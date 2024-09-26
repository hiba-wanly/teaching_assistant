import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/add_subject/data/data_source/subject_remote_data_source.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/domain/repos/subject_repo.dart';

class SubjectRepoImpl extends SubjectRepo {
  final SubjectRemoteDataSource subjectRemoteDataSource;

  SubjectRepoImpl({
    required this.subjectRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Subject>>> fetchAddSubject(Map<String,dynamic> data) async {
    try {
      debugPrint("KKKHEREERER");
      List<Subject> nums;
      nums = await subjectRemoteDataSource.fetchAddSubject(data);
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
  Future<Either<ServerFailure, List<Subject>>> fetchUpdateSubject(Map<String,dynamic> data  , int id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Subject> nums;
      nums = await subjectRemoteDataSource.fetchUpdateSubject(data, id);
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
  Future<Either<ServerFailure, List<Subject>>> fetchDeleteSubject(int id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Subject> nums;
      nums = await subjectRemoteDataSource.fetchDeleteSubject( id);
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
