import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/core/utils/app_router.dart';
import 'package:teachers_marks/core/utils/simple_bloc_observer.dart';
import 'package:teachers_marks/features/add_subject/data/data_source/subject_remote_data_source.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/data/repos/subject_repo_impl.dart';
import 'package:teachers_marks/features/add_subject/domain/use_cases/fetch_subject_use_case.dart';
import 'package:teachers_marks/features/add_subject/presentations/manager/subject_cubit/subject_cubit.dart';
import 'package:teachers_marks/features/attendance/data/data_source/attendance_remote_data_source.dart';
import 'package:teachers_marks/features/attendance/data/repos/attendance_repo_impl.dart';
import 'package:teachers_marks/features/attendance/domain/use_cases/fetch_attendance_use_case.dart';
import 'package:teachers_marks/features/attendance/presentations/manager/attendance_cubit/attendance_cubit.dart';
import 'package:teachers_marks/features/attendance_log/data/data_source/attendance_log_remote_data_source.dart';
import 'package:teachers_marks/features/attendance_log/data/repos/attendance_log_repo_impl.dart';
import 'package:teachers_marks/features/attendance_log/domain/use_cases/fetch_attendance_log_use_case.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_cubit/attendance_log_cubit.dart';
import 'package:teachers_marks/features/departments/data/data_source/department_remote_data_source.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/data/repos/department_repo_impl.dart';
import 'package:teachers_marks/features/departments/domain/use_cases/fetch_department_use_case.dart';
import 'package:teachers_marks/features/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/general_information_cubit/general_information_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/lucturer_cubit/lecturer_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_cubit.dart';
import 'package:teachers_marks/features/home/data/data_source/home_remote_data_source.dart';
import 'package:teachers_marks/features/home/data/repos/home_repo_impl.dart';
import 'package:teachers_marks/features/home/domain/use_cases/fetch_home_use_case.dart';
import 'package:teachers_marks/features/home/presentations/manager/home_cubit/home_cubit.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';
import 'package:teachers_marks/features/lecturer/data/data_source/lecturer_remote_data_source.dart';
import 'package:teachers_marks/features/lecturer/data/repos/lecturer_repo_impl.dart';
import 'package:teachers_marks/features/lecturer/domain/use_cases/fetch_lecturer_use_case.dart';
import 'package:teachers_marks/features/lecturer/presentations/manager/lecturer_cubit/lecturer_subject_cubit.dart';
import 'package:teachers_marks/features/login/data/data_source/login_remote_data_source.dart';
import 'package:teachers_marks/features/login/data/repos/login_repo_impl.dart';
import 'package:teachers_marks/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_cubit.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart';
import 'package:teachers_marks/splash_screen.dart';
import 'package:flutter/services.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  Bloc.observer = SimpleBlocObserver();

  bool isLoggedIn =
      ((await SharedPreferences.getInstance()).getString("token") != null);
  String? user_id =
      (await SharedPreferences.getInstance()).getString("user_id");
  String? lecturer_id =
      (await SharedPreferences.getInstance()).getString("lecturer_id");
  String? userName =
      (await SharedPreferences.getInstance()).getString("userName");
  String? name = (await SharedPreferences.getInstance()).getString("name");
  String? email = (await SharedPreferences.getInstance()).getString("email");

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    user_id: user_id,
    lecturer_id: lecturer_id,
    userName: userName,
    name: name,
    email: email,
  ));
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  MyApp({
    this.isLoggedIn,
    this.user_id,
    this.lecturer_id,
    this.userName,
    this.name,
    this.email,
  });

  final isLoggedIn;
  final user_id;
  final lecturer_id;
  final userName;
  final name;
  final email;

  bool success = false;

  late List<Departments>? depatrment;
  late GeneralInformation? generalInformation;

  late List<Subject>? subjects;

  late List<Lecturer>? lecturer;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit(
            FetchLoginUseCase(
              LoginRepoImpl(
                loginRemoteDataSource: LoginRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            isLoggedIn: isLoggedIn,
            user_id: user_id ?? "",
            lecturer_id: lecturer_id ?? "",
            userName: userName ?? "",
            name: name ?? "",
            email: email ?? "",
          );
        }),
        BlocProvider(create: (context) {
          return DepartmentCubit(
            FetchDepartmentUseCase(
              DepartmentRepoImpl(
                departmentRemoteDataSource: DepartmentRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return LecturerCubit(
            FetchLecturerUseCase(
              DepartmentRepoImpl(
                departmentRemoteDataSource: DepartmentRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return GeneralInformationCubit(
            FetchGeneralInformationUseCase(
              DepartmentRepoImpl(
                departmentRemoteDataSource: DepartmentRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return SubjectCubit(
            FetchSubjectUseCase(
              SubjectRepoImpl(
                subjectRemoteDataSource: SubjectRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return HomeCubit(
            FetchHomeUseCase(
              HomeRepoImpl(
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            // subject: subjects ?? [],
          );
        }),
        BlocProvider(create: (context) {
          return LecturerSubjectCubit(
            FetchLecturerSubjectUseCase(
              LecturerRepoImpl(
                lecturerRemoteDataSource: LecturerRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            // subject: subjects ?? [],
          );
        }),
        BlocProvider(create: (context) {
          return AttendanceCubit(
            FetchAttendanceUseCase(
              AttendanceRepoImpl(
                attendanceRemoteDataSource: AttendanceRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            // subject: subjects ?? [],
          );
        }),
        BlocProvider(create: (context) {
          return AttendanceLogCubit(
            FetchAttendanceLogUseCase(
              AttendanceLogRepoImpl(
                attendanceLogRemoteDataSource: AttendanceLogRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
            FetchAttendanceLogStringUseCase(
              AttendanceLogRepoImpl(
                attendanceLogRemoteDataSource: AttendanceLogRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),

            // subject: subjects ?? [],
          );
        }),
        BlocProvider(create: (context) {
          return StudentCubit(
            FetchStudentUseCase(
              DepartmentRepoImpl(
                departmentRemoteDataSource: DepartmentRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: kPrimaryColor,
            fontFamily: "Almarai",
            primarySwatch: Colors.blue,
          ),
          home:
          isLoggedIn ? SplashScreen() : WelcomeView()
          // const WelcomeView(),
          ),
    );
  }
}
