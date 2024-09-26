import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/home/domain/repos/home_repo.dart';
import 'use_case.dart';

class FetchHomeUseCase extends UseCase<List<Subject>, NoParam> {
  final HomeRepo homeRepo;
  FetchHomeUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<Subject>>> callMySubject( [NoParam? param]) async {
    return await homeRepo.fetchMySubjectData();
  }

}

