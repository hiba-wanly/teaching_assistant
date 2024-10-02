import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_student_log_model.dart';

abstract class AttendanceLogRepo {
  Future<Either<ServerFailure, String>> fetchAddAttendanceLog(List<Map<String,dynamic>> data);
  // Future<Either<ServerFailure, List<AttendanceLog>>> fetchGetStudentSubject( int sub_id);
  Future<Either<ServerFailure, List<AttendanceLog>>> fetchGetStudentAttendanceLog( int att_id);
  Future<Either<ServerFailure, List<AttendanceStudentLog>>> fetchGetAttendanceStudentLog(int stu_id, int att_id);
}
