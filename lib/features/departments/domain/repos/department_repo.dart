import 'package:dartz/dartz.dart';
import 'package:teachers_marks/core/errors/failure.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';

abstract class DepartmentRepo {
  Future<Either<ServerFailure, List<Departments>>> fetchDepartmentData();
  Future<Either<ServerFailure, List<Lecturer>>> fetchLecturerData();
  Future<Either<ServerFailure, GeneralInformation>> fetchGeneralInformationData();
  Future<Either<ServerFailure, List<Student>>> fetchGetStudentSubject( int sub_id);
}
