import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/login/data/models/login_model.dart';
import 'package:teachers_marks/features/login/domain/repos/login_repo.dart';

import 'use_case.dart';

class FetchLoginUseCase extends UseCase<Login, NoParam> {
  final LoginRepo loginRepo;
  FetchLoginUseCase(this.loginRepo);

  @override
  Future<Either<Failure, Login>> callLogout( [NoParam? param]) async {
    return await loginRepo.logoutUser();
  }

  @override
  Future<Either<Failure, Login>> callLogin(Map<String, dynamic> data2,
      [NoParam? param]) async {
    return await loginRepo.fetchLoginData(data2);
  }

  @override
  Future<Either<Failure, Login>> callSignUp(Map<String, dynamic> data2,
      [NoParam? param]) async {
    return await loginRepo.fetchSignupData(data2);
  }
}
