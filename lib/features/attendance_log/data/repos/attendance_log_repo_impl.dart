import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/attendance_log/data/data_source/attendance_log_remote_data_source.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_student_log_model.dart';
import 'package:teachers_marks/features/attendance_log/domain/repos/attendance_log_repo.dart';

class AttendanceLogRepoImpl extends AttendanceLogRepo {
  final AttendanceLogRemoteDataSource attendanceLogRemoteDataSource;

  AttendanceLogRepoImpl({
    required this.attendanceLogRemoteDataSource,
  });

  @override
  Future<Either<ServerFailure, String>> fetchAddAttendanceLog(List<Map<String,dynamic>> data) async {
    try {
      debugPrint("KKKHEREERER");
      String nums;
      nums = await attendanceLogRemoteDataSource.fetchAddAttendanceLog(data);
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
  Future<Either<ServerFailure, List<AttendanceStudentLog>>> fetchGetAttendanceStudentLog(int sub_id, int att_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<AttendanceStudentLog> nums;
      nums = await attendanceLogRemoteDataSource.fetchGetAttendanceStudentLog( sub_id, att_id);
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
  Future<Either<ServerFailure, List<AttendanceLog>>> fetchGetStudentAttendanceLog( int att_id) async {
    try {
      debugPrint("KKKHEREERER");
      List<AttendanceLog> nums;
      nums = await attendanceLogRemoteDataSource.fetchGetStudentAttendanceLog( att_id );
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
