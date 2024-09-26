import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';
import 'package:teachers_marks/features/departments/domain/repos/department_repo.dart';
import 'use_case.dart';

class FetchDepartmentUseCase extends UseCase<List<Departments>, NoParam> {
  final DepartmentRepo departmentRepo;
  FetchDepartmentUseCase(this.departmentRepo);

  @override
  Future<Either<Failure, List<Departments>>> callDepartment( [NoParam? param]) async {
    return await departmentRepo.fetchDepartmentData();
  }

  @override
  Future<Either<Failure, List<Departments>>> callLecturer([NoParam? param]) {
    // TODO: implement callLecturer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Departments>>> callGeneralInformation([NoParam? param]) {
    // TODO: implement callGeneralInformation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Departments>>> callStudent(int sub_id, [NoParam? param]) {
    // TODO: implement callStudent
    throw UnimplementedError();
  }

}


class FetchLecturerUseCase extends UseCase<List<Lecturer>, NoParam> {
  final DepartmentRepo departmentRepo;
  FetchLecturerUseCase(this.departmentRepo);

  @override
  Future<Either<Failure, List<Lecturer>>> callLecturer( [NoParam? param]) async {
    return await departmentRepo.fetchLecturerData();
  }

  @override
  Future<Either<Failure, List<Lecturer>>> callDepartment([NoParam? param]) {
    // TODO: implement callLecturer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Lecturer>>> callGeneralInformation([NoParam? param]) {
    // TODO: implement callGeneralInformation
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, List<Lecturer>>> callStudent(int sub_id, [NoParam? param]) {
    // TODO: implement callStudent
    throw UnimplementedError();
  }

}

class FetchGeneralInformationUseCase extends UseCase<GeneralInformation, NoParam> {
  final DepartmentRepo departmentRepo;
  FetchGeneralInformationUseCase(this.departmentRepo);

  @override
  Future<Either<Failure, GeneralInformation>> callLecturer( [NoParam? param])  {
// TODO: implement callLecturer
    throw UnimplementedError();  }

  @override
  Future<Either<Failure, GeneralInformation>> callDepartment([NoParam? param]) {
    // TODO: implement callLecturer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GeneralInformation>> callGeneralInformation([NoParam? param]) async {
    return await departmentRepo.fetchGeneralInformationData();
  }
  @override
  Future<Either<Failure, GeneralInformation>> callStudent(int sub_id, [NoParam? param]) {
    // TODO: implement callStudent
    throw UnimplementedError();
  }

}


class FetchStudentUseCase extends UseCase<List<Student>, NoParam> {
  final DepartmentRepo departmentRepo;
  FetchStudentUseCase(this.departmentRepo);

  @override
  Future<Either<Failure, List<Student>>> callLecturer( [NoParam? param])  {
// TODO: implement callLecturer
    throw UnimplementedError();  }

  @override
  Future<Either<Failure, List<Student>>> callDepartment([NoParam? param]) {
    // TODO: implement callLecturer
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Student>>> callGeneralInformation([NoParam? param])  {
    // TODO: implement callLecturer
    throw UnimplementedError();

  }
  @override
  Future<Either<Failure, List<Student>>> callStudent(int sub_id, [NoParam? param]) async{
    return await departmentRepo.fetchGetStudentSubject(sub_id);
  }

}