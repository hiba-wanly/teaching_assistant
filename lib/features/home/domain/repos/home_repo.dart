import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';

abstract class HomeRepo {
  Future<Either<ServerFailure, List<Subject>>> fetchMySubjectData();

}
