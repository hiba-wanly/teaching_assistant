import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/domain/repos/subject_repo.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/lecturer/domain/repos/lecturer_repo.dart';
import 'use_case.dart';

class FetchLecturerSubjectUseCase extends UseCase<List<Lecturer>, NoParam> {
  final LecturerRepo lecturerRepo;
  FetchLecturerSubjectUseCase(this.lecturerRepo);

  @override
  Future<Either<Failure, List<Lecturer>>> callAddLecturer(Map<String,dynamic> data ,  [NoParam? param]) async {
    return await lecturerRepo.fetchAddLecturer(data);
  }
  @override
  Future<Either<Failure, List<Lecturer>>> callGetLecturer( int sub_id, [NoParam? param]) async {
    return await lecturerRepo.fetchGetLecturer(sub_id);
  }
  @override
  Future<Either<Failure, List<Lecturer>>> callDeleteLecturer(int sub_id,int lect_id,  [NoParam? param]) async {
    return await lecturerRepo.fetchDeleteLecturer(sub_id, lect_id);
  }

}

