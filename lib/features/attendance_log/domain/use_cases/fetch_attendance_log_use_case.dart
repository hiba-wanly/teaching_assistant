import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';
import 'package:teachers_marks/features/attendance_log/domain/repos/attendance_log_repo.dart';
import 'use_case.dart';

class FetchAttendanceLogUseCase extends UseCase<List<AttendanceLog>, NoParam> {
  final AttendanceLogRepo attendanceLogRepo;
  FetchAttendanceLogUseCase(this.attendanceLogRepo);


  // @override
  // Future<Either<Failure, List<AttendanceLog>>> callGetStudentSubject(int sub_id, [NoParam? param]) async {
  //   return await attendanceLogRepo.fetchGetStudentSubject(sub_id);
  // }
  @override
  Future<Either<Failure, List<AttendanceLog>>> callGetStudentAttendanceLog( int att_id,  [NoParam? param]) async {
    return await attendanceLogRepo.fetchGetStudentAttendanceLog( att_id);
  }

  @override
  Future<Either<Failure, List<AttendanceLog>>> callAddAttendanceLog(List<Map<String, dynamic>> data, [NoParam? param]) {
    // TODO: implement callAddAttendanceLog
    throw UnimplementedError();
  }



}


class FetchAttendanceLogStringUseCase extends UseCase<String, NoParam>{
final AttendanceLogRepo attendanceLogRepo;
FetchAttendanceLogStringUseCase(this.attendanceLogRepo);
@override
Future<Either<Failure,String>> callAddAttendanceLog(List<Map<String,dynamic>> data ,  [NoParam? param]) async {
  return await attendanceLogRepo.fetchAddAttendanceLog(data);
}

  @override
  Future<Either<Failure, String>> callGetStudentAttendanceLog(int att_id, [NoParam? param]) {
    // TODO: implement callGetStudentAttendanceLog
    throw UnimplementedError();
  }
}
