import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/signup/data/models/signup_model.dart';
import 'package:teachers_marks/features/signup/domain/repos/signup_repo.dart';

import 'use_case.dart';

class FetchSignupUseCase extends UseCase<SignUp, NoParam> {
  final SignupRepo signupRepo;
  FetchSignupUseCase(this.signupRepo);

  @override
  Future<Either<Failure, SignUp>> callLogout(int id, [NoParam? param]) async {
    return await signupRepo.logoutUser(id);
  }

  @override
  Future<Either<Failure, SignUp>> callLogin(Map<String, dynamic> data2,
      [NoParam? param]) async {
    return await signupRepo.fetchSignupData(data2);
  }
}
