import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';

abstract class AttendanceRepo {
  Future<Either<ServerFailure, List<Attendance>>> fetchAddAttendance(Map<String,dynamic> data);
  Future<Either<ServerFailure, List<Attendance>>> fetchGetAttendance( int sub_id);
  Future<Either<ServerFailure, List<Attendance>>> fetchDeleteAttendance( int att_id);
}
