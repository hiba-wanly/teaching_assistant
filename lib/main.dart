import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/utils/api_service.dart';
import 'package:teachers_marks/core/utils/app_router.dart';
import 'package:teachers_marks/core/utils/simple_bloc_observer.dart';
import 'package:teachers_marks/features/login/data/data_source/login_remote_data_source.dart';
import 'package:teachers_marks/features/login/data/repos/login_repo_impl.dart';
import 'package:teachers_marks/features/login/domain/use_cases/fetch_login_use_case.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_cubit.dart';
import 'package:teachers_marks/features/signup/data/data_source/signup_remote_data_source.dart';
import 'package:teachers_marks/features/signup/data/repos/signup_repo_impl.dart';
import 'package:teachers_marks/features/signup/domain/use_cases/fetch_signup_use_case.dart';
import 'package:teachers_marks/features/signup/presentations/manager/signup_cubit/signup_cubit.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart';

void main() {
  runApp(const MyApp());
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  Bloc.observer = SimpleBlocObserver();

}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) {
          return LoginCubit(
            FetchLoginUseCase(
              LoginRepoImpl(
                loginRemoteDataSource: LoginRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),
          );
        }),
        BlocProvider(
            create: (context) {
              return SignupCubit(
                FetchSignupUseCase(
                  SignupRepoImpl(
                    signupRemoteDataSource: SignupRemoteDataSourceImpl(
                      getIt.get<ApiService>(),
                    ),
                  ),
                ),
              );
            }),
      ],
        child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
          // initialRoute: '/',
          // routes: {
          //   AppRouter.kHomeView: (context) => SplashScreen(repository: repository),
          //   AppRouter.kWelcomeView: (context) => HomeView(repository: repository),
          //   AppRouter.kLectuer: (context) => FinanceView(repository: repository),
          //   AppRouter.kLogin: (context) =>
          //       MaterialView(repository: repository),
          //   AppRouter.kSignup: (context) => OtherView(repository: repository),
          //   AppRouter.kPrinters: (context) =>
          //       PrintersView(repository: repository),
          // },
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: kPrimaryColor,
          fontFamily: "Almarai",
          primarySwatch: Colors.blue,

        ),
        home: const WelcomeView(),
            ),
      );
  }
}
