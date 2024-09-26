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
        return left(ServerFailure.fromDioError(e));
      }
      debugPrint("ERORROROR22222222222");
      debugPrint(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Login>> logoutUser() async {
    try {
      debugPrint("ADDMATERIALLLLLLL");
      Login nums;
      nums = await loginRemoteDataSource.logoutUser();
      return right(nums);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<ServerFailure, Login>> fetchSignupData(
      Map<String, dynamic> data2) async {
    try {
      debugPrint("KKKHEREERER");
      Login nums;
      nums = await loginRemoteDataSource.fetchSignupData(data2);
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

  // @override
  // Future<Either<ServerFailure, SignUp>> logoutUser(dynamic id) async {
  //   try {
  //     debugPrint("ADDMATERIALLLLLLL");
  //     SignUp nums;
  //     nums = await signupRemoteDataSource.logoutUser(id);
  //     return right(nums);
  //   } catch (e) {
  //     if (e is DioError) {
  //       return left(ServerFailure.fromDioError(e));
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

}
