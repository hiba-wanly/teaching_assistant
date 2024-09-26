import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';

abstract class LecturerRepo {
  Future<Either<ServerFailure, List<Lecturer>>> fetchAddLecturer(Map<String,dynamic> data);
  Future<Either<ServerFailure, List<Lecturer>>> fetchGetLecturer( int sub_id);
  Future<Either<ServerFailure, List<Lecturer>>> fetchDeleteLecturer(int sub_id, int lect_id);
}
