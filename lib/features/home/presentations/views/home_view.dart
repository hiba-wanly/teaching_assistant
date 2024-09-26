import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/presentations/manager/subject_cubit/subject_cubit.dart';
import 'package:teachers_marks/features/add_subject/presentations/manager/subject_cubit/subject_state.dart';
import 'package:teachers_marks/features/add_subject/presentations/views/add_subject_view.dart';
import 'package:teachers_marks/features/add_subject/presentations/views/update_subject_view.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:teachers_marks/features/home/presentations/manager/home_cubit/home_cubit.dart';
import 'package:teachers_marks/features/home/presentations/views/details_of_lectuer.dart';
import 'package:teachers_marks/features/home/presentations/views/widgets/grid_layout_widget.dart';
import 'package:teachers_marks/features/home/presentations/views/widgets/lectuer_card.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_cubit.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_state.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double h = 1;
  double w = 1;
  int? loadingIndex;

  final GlobalKey<ScaffoldState> _sKey = GlobalKey();
  late List<Subject> subjects ;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
// }

  List<Departments> _section = [];
  late String? dropdownSectionValue;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    subjects = BlocProvider
        .of<HomeCubit>(context).subject;

    _section = BlocProvider
        .of<DepartmentCubit>(context).department;
    // debugPrint("subjectsCOUNT");
    // debugPrint(subjects[0].subject_name);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _sKey,
        appBar:
            // CustomAppBar(text: "موادي", h: h,),
            AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("موادي",style: TextStyle(
        fontFamily: Almarai,))),
          actions: [
            IconButton(
              padding: EdgeInsets.only(
// top: 8.0
                  top: h * 0.005),
              onPressed: () {
                _sKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.black,
                size:
// 30,
                    w * 0.09,
              ),
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                stops: [0.1, 0.6],
                tileMode: TileMode.repeated,
                colors: [kButtonColorBlue1, kButtonColorBlue2],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        drawer: Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: <Widget>[
                DrawerHeader(
// decoration: BoxDecoration
//   (
//   color: Colors.red
// ),
                    child: Column(
                  children: [
                  //   Text(
                  // BlocProvider
                  //     .of<LoginCubit>(context).name,
                  //       style: TextStyle(
                  //     fontFamily: Almarai,)),
                    Text(BlocProvider
                        .of<LoginCubit>(context).name,style: TextStyle(
                      fontFamily: Almarai,)),
                  ],
                )),
                ListTile(
                  title: Text("موادي",style: TextStyle(
                    fontFamily: Almarai,)),
                  onTap: () {
                    Get.to(HomeView());
                  },
                ),
                ListTile(
                  title: Text("حسابي",style: TextStyle(
                    fontFamily: Almarai,)),
                  onTap: () {
                    Get.to(HomeView());
                  },
                ),
                BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        Get.to(WelcomeView());
                      }
                      if (state is LoginFailure) {
                        // debugPrint("kkkLoginFailure");
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message: state.errMessage,
                        ).show(context);
                        // Navigator.pop(context);
                      }
                    }, builder: (context, state) {
                  if (state is LoginLoading) {
                    return  ListTile(
                      leading: CircularProgressIndicator(),
                      title: Text("تسجيل خروج",style: TextStyle(
                        fontFamily: Almarai,)),
                      onTap: () {
                      },
                    );
                  } else {
                    return  ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("تسجيل خروج",style: TextStyle(
                        fontFamily: Almarai,)),
                      onTap: () {
                        BlocProvider.of<LoginCubit>(context)
                            .logout();
                      },
                    );
                  }
                }),

              ],
            )),
        body:  subjects == null ? Container() :ListView.builder(
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(LectuerDetails(subject:
                subjects[index]));
                // debugPrint("clicked1");
              },
              child: Container(
                height: h * 0.15,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: kButtonColorBlue2,
                      width: 6,
                    ),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Spacer(),
                        Text(
                          subjects[index].subject_name ?? "",
                          style: TextStyle(fontSize: 18,fontFamily: Almarai,),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                // Get.to(UpdateSubjectView(subject:
                                // subjects[index]

                                // ));
                                // debugPrint("clicked");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateSubjectView(subject:subjects[index])
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: w*0.05),
                BlocConsumer<SubjectCubit, SubjectState>(
                    listener: (context, state) {
                      if (state is SubjectSuccess) {
                        BlocProvider.of<HomeCubit>(context)
                            .updateSubject(state.subject);
                        setState((){
                          subjects = BlocProvider
                              .of<HomeCubit>(context).subject;
                        });

                        // update list of subject
                        // Get.off(HomeView());
                      }
                      if (state is SubjectFailure) {
                        // debugPrint("kkkSubjectFailure");
                        Flushbar(
                          duration: const Duration(seconds: 3),
                          backgroundColor: Colors.white,
                          messageColor: Colors.black,
                          messageSize: h * 0.02,
                          message: state.errMessage,
                        ).show(context);
                        // Navigator.pop(context);
                      }
                    }, builder: (context, state) {
                  if (state is SubjectLoading) {
                    return InkWell(
                      onTap: () {
                      },
                      child: loadingIndex == index
                          ? CircularProgressIndicator(color: Colors.blue) :
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          loadingIndex = index; // Track the pressed button
                        });
                        BlocProvider.of<SubjectCubit>(context)
                            .deleteSubject(subjects[index].id);
                        // debugPrint("clicked");
                      },
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    );
                  }
                }),

                          ],
                        )
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          _section
                          .firstWhere((dept) => dept.id == subjects[index].departments,
                            // orElse: () => _section[0]
                        )
                            .name ,
                              // subjects[index].departments.toString(),
                              style: TextStyle(
                        fontFamily: Almarai,)),
                          Text( subjects[index]?.academic_year ?? "",style: TextStyle(
                            fontFamily: Almarai,)),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffc5cae9),
          onPressed: () {
            // Get.to(AddSubjectView());
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddSubjectView()
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}


