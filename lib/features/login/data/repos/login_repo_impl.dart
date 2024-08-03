import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/login/data/data_source/login_remote_data_source.dart';
import 'package:teachers_marks/features/login/data/models/login_model.dart';
import 'package:teachers_marks/features/login/domain/repos/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, Login>> fetchLoginData(
      Map<String, dynamic> data2) async {
    try {
      debugPrint("KKKHEREERER");
      Login nums;
      nums = await loginRemoteDataSource.fetchLoginData(data2);
      debugPrint("AAAAAAAA");
      debugPrint(nums.toString());
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        debugPrint("ERORRORORO11111111111");
        return left(ServerFailure("cannot login "));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Login>> logoutUser(dynamic id) async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      Login nums;
      nums = await loginRemoteDataSource.logoutUser(id);
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
