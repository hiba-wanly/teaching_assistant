import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/domain/repos/subject_repo.dart';
import 'use_case.dart';

class FetchSubjectUseCase extends UseCase<List<Subject>, NoParam> {
  final SubjectRepo subjectRepo;
  FetchSubjectUseCase(this.subjectRepo);

  @override
  Future<Either<Failure, List<Subject>>> callAddSubject(Map<String,dynamic> data ,  [NoParam? param]) async {
    return await subjectRepo.fetchAddSubject(data);
  }
  @override
  Future<Either<Failure, List<Subject>>> callUpdateSubject(Map<String,dynamic> data  , int id, [NoParam? param]) async {
    return await subjectRepo.fetchUpdateSubject(data, id);
  }
  @override
  Future<Either<Failure, List<Subject>>> callDeleteSubject(int id,  [NoParam? param]) async {
    return await subjectRepo.fetchDeleteSubject(id);
  }

}

