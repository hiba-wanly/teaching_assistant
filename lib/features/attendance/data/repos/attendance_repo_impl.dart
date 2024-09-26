import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/attendance/data/data_source/attendance_remote_data_source.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:teachers_marks/features/attendance/domain/repos/attendance_repo.dart';

class AttendanceRepoImpl extends AttendanceRepo {
  final AttendanceRemoteDataSource attendanceRemoteDataSource;

  AttendanceRepoImpl({
    required this.attendanceRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, List<Attendance>>> fetchAddAttendance(Map<String,dynamic> data) async {
    try {
      debugPrint("KKKHEREERER");
      List<Attendance> nums;
      nums = await attendanceRemoteDataSource.fetchAddAttendance(data);
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
  Future<Either<ServerFailure, List<Attendance>>> fetchGetAttendance(int sub_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Attendance> nums;
      nums = await attendanceRemoteDataSource.fetchGetAttendance( sub_id);
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
  Future<Either<ServerFailure, List<Attendance>>> fetchDeleteAttendance( int att_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<Attendance> nums;
      nums = await attendanceRemoteDataSource.fetchDeleteAttendance( att_id );
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
