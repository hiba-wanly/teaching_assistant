import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:teachers_marks/features/attendance/domain/repos/attendance_repo.dart';
import 'use_case.dart';

class FetchAttendanceUseCase extends UseCase<List<Attendance>, NoParam> {
  final AttendanceRepo attendanceRepo;
  FetchAttendanceUseCase(this.attendanceRepo);

  @override
  Future<Either<Failure, List<Attendance>>> callAddAttendance(Map<String,dynamic> data ,  [NoParam? param]) async {
    return await attendanceRepo.fetchAddAttendance(data);
  }
  @override
  Future<Either<Failure, List<Attendance>>> callGetAttendance( int sub_id, [NoParam? param]) async {
    return await attendanceRepo.fetchGetAttendance(sub_id);
  }
  @override
  Future<Either<Failure, List<Attendance>>> callDeleteAttendance(int att_id,  [NoParam? param]) async {
    return await attendanceRepo.fetchDeleteAttendance( att_id);
  }



}

