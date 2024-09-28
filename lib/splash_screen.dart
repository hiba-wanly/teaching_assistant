import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/core/widgets/loading_page.dart';
import 'package:teachers_marks/features/departments/data/models/general_information.dart';
import 'package:teachers_marks/features/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/department_cubit/department_state.dart';
import 'package:teachers_marks/features/departments/presentations/manager/general_information_cubit/general_information_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/general_information_cubit/general_information_state.dart';
import 'package:teachers_marks/features/departments/presentations/manager/lucturer_cubit/lecturer_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/lucturer_cubit/lucturer_state.dart';
import 'package:teachers_marks/features/home/presentations/manager/home_cubit/home_cubit.dart';
import 'package:teachers_marks/features/home/presentations/manager/home_cubit/home_state.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LoadGeneralInformation();
  }
}

///load GeneralInformation
class LoadGeneralInformation extends StatefulWidget {
  LoadGeneralInformation({Key? key}) : super(key: key);

  @override
  _LoadGeneralInformationState createState() => _LoadGeneralInformationState();
}

class _LoadGeneralInformationState extends State<LoadGeneralInformation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GeneralInformationCubit>(context)
        .fetchGeneralInformationData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GeneralInformationCubit, GeneralInformationState>(
      builder: (context, state) {
        if (state is GeneralInformationSuccess) {
          BlocProvider.of<GeneralInformationCubit>(context)
              .updateGeneralInformation(state.General_nformation);
          return LoadDepartments();
        } else if (state is GeneralInformationFailure) {
          return LoadGeneralInformation();
        } else {
          return Scaffold(backgroundColor: Colors.white, body: LoadingPage());
        }
      },
    );
  }
}

///load Departments
class LoadDepartments extends StatefulWidget {
  LoadDepartments({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadDepartments> createState() => _LoadDepartmentsState();
}

class _LoadDepartmentsState extends State<LoadDepartments> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<DepartmentCubit>(context).fetchDepartmentData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DepartmentCubit, DepartmentState>(
      builder: (context, state) {
        if (state is DepartmentSuccess) {
          BlocProvider.of<DepartmentCubit>(context)
              .updateDepartment(state.departments);
          return LoadLecturer();
        } else if (state is DepartmentFailure) {
          return LoadDepartments();
        } else {
          return Scaffold(backgroundColor: Colors.white, body: LoadingPage());
        }
      },
    );
  }
}

///load Lecturer
class LoadLecturer extends StatefulWidget {
  LoadLecturer({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadLecturer> createState() => _LoadLecturerState();
}

class _LoadLecturerState extends State<LoadLecturer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LecturerCubit>(context).fetchLecturerData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LecturerCubit, LecturerState>(
      builder: (context, state) {
        if (state is LecturerSuccess) {
          BlocProvider.of<LecturerCubit>(context)
              .updateLecturer(state.lecturer);
          return LoadSubject();
        } else if (state is LecturerFailure) {
          return LoadLecturer();
        } else {
          return Scaffold(backgroundColor: Colors.white, body: LoadingPage());
        }
      },
    );
  }
}

///load Subject
class LoadSubject extends StatefulWidget {
  LoadSubject({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadSubject> createState() => _LoadSubjectState();
}

class _LoadSubjectState extends State<LoadSubject> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchMySubjectData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeSuccess) {
          BlocProvider.of<HomeCubit>(context).updateSubject(state.subject);
          return HomeView();
        } else if (state is HomeFailure) {
          return LoadSubject();
        } else {
          return Scaffold(backgroundColor: Colors.white, body: LoadingPage());
        }
      },
    );
  }
}
