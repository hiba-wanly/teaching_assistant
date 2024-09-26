import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';

abstract class SubjectRepo {
  Future<Either<ServerFailure, List<Subject>>> fetchAddSubject(Map<String,dynamic> data);
  Future<Either<ServerFailure, List<Subject>>> fetchUpdateSubject(Map<String,dynamic> data  , int id);
  Future<Either<ServerFailure, List<Subject>>> fetchDeleteSubject(int id);
}
