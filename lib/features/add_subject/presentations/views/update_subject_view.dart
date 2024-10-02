import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/awesome_dialog_widget.dart';
import 'package:teachers_marks/core/widgets/button_loading.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/core/widgets/custom_button_auth.dart';
import 'package:teachers_marks/core/widgets/drop_down_widget.dart';
import 'package:teachers_marks/core/widgets/text_box_controller.dart';
import 'package:teachers_marks/core/widgets/text_style.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/add_subject/presentations/manager/subject_cubit/subject_cubit.dart';
import 'package:teachers_marks/features/add_subject/presentations/manager/subject_cubit/subject_state.dart';
import 'package:teachers_marks/features/departments/data/models/department_model.dart';
import 'package:teachers_marks/features/departments/presentations/manager/department_cubit/department_cubit.dart';
import 'package:teachers_marks/features/home/presentations/manager/home_cubit/home_cubit.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart';

class UpdateSubjectView extends StatefulWidget {
  Subject subject;
  UpdateSubjectView({super.key, required this.subject});
  @override
  State<UpdateSubjectView> createState() => _UpdateSubjectViewState();
}

class _UpdateSubjectViewState extends State<UpdateSubjectView> {
  double h = 1;
  double w = 1;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: CustomAppBar(
            h: h,
            w: w,
            text: "تعديل مادة",
          ),
          body: UpdateCustomForm(subject: widget.subject),
        ));
  }
}

class UpdateCustomForm extends StatefulWidget {
  Subject subject;
  UpdateCustomForm({super.key, required this.subject});

  @override
  State<UpdateCustomForm> createState() => _UpdateCustomFormState();
}

class _UpdateCustomFormState extends State<UpdateCustomForm> {
  double h = 1;
  double w = 1;
  final _formKey = GlobalKey<FormState>();
  // List<String> _academicYear = academicYear;
  // ["أولى", "ثانية", "ثالثة", "رابعة", "خامسة"];
  List<AcademicSemester> AcademicYear = academicYearCon;
  int? selectedAcademicYear;
  var AcademicYearList;
  // String? selectedAcademicYear;
  int? selectedDepartmentId;
  List<AcademicSemester> Semester = semesterCon;

  List<Departments> _section = [];

  late String? dropdownSectionValue;

  bool show = false;
  var _sectionList;
  @override
  void initState() {
    super.initState();
  }

  TextEditingController subjectnameController = new TextEditingController();

  TextEditingController tests_markController = new TextEditingController();
  TextEditingController attendance_markController = new TextEditingController();
  TextEditingController interviews_markController = new TextEditingController();
  TextEditingController homework_markController = new TextEditingController();
  TextEditingController labs_markController = new TextEditingController();

  TextEditingController total_markController = new TextEditingController();
  TextEditingController practical_markController = new TextEditingController();


  late Subject subject;

  @override
  Widget build(BuildContext context) {
    _section = BlocProvider.of<DepartmentCubit>(context).department;

    // selectedAcademicYear = AcademicYear
    //     .firstWhere(
    // (dept) => dept.id == widget.subject.academic_year,
    // orElse: () => AcademicYear[0]
    // )
    //     .acadsemester;
    selectedAcademicYear = widget.subject.academic_year;
    selectedDepartmentId = widget.subject.departments;
    dropdownSectionValue = _section
        .firstWhere((dept) => dept.id == widget.subject.departments,
            orElse: () => _section[0])
        .name;
    AcademicYearList = AcademicYear.map<DropdownMenuItem<String>>(
            (AcademicSemester as) {
          return DropdownMenuItem<String>(
            value: as.acadsemester,
            child: TEXT(text: as.acadsemester, w: w * 0.035),);
        }).toList();
    _sectionList = _section.map<DropdownMenuItem<String>>(
            (Departments department) {
          return DropdownMenuItem<String>(
              value: department.name,
              child:
              TEXT(text: department.name, w: w * 0.035));
        }).toList();
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: h * 0.01, bottom: h * 0.01, left: w * 0.02, right: w * 0.02),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: h * 0.01,
                  bottom: h * 0.01,
                  left: w * 0.02,
                  right: w * 0.02),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          Semester
                              .firstWhere(
                                  (dept) => dept.id == widget.subject.semester,
                              orElse: () => Semester[0]
                          )
                              .acadsemester,

                          style: TextStyle(
                            color: kButtonColorBlue1,
                            fontFamily: Almarai,
                          ),
                        ),
                        Text(
                          widget.subject.year,
                          style: TextStyle(
                            color: kButtonColorBlue1,
                            fontFamily: Almarai,
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextFormField(
                    controller: subjectnameController,
                    decoration: InputDecoration(
                        labelText: 'اسم المادة*',
                        hintText: widget.subject.subject_name != null
                            ? widget.subject.subject_name.toString()
                            : "",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: Almarai,
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                        ))),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "السنة الدراسية",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: Almarai,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.009,
                        ),
                        DropDownWidget(
                          list:  AcademicYear.map<DropdownMenuItem<String>>(
                                  (AcademicSemester as) {
                                return DropdownMenuItem<String>(
                                  value: as.acadsemester,
                                  child: TEXT(text: as.acadsemester, w: w * 0.035),);
                              }).toList(),

                          w: w * 0.05,
                          text: 'السنة الدراسية',
                          selected: AcademicYear
                              .firstWhere(
                                (dept) => dept.id == selectedAcademicYear,
                            orElse: () => AcademicYear[0]
                          )
                              .acadsemester,
                          onChanged: (value) {
                            setState(() {
                              selectedAcademicYear = AcademicYear
                                  .firstWhere((dept) => dept.acadsemester == value)
                                  .id;                              });
                            print(selectedAcademicYear);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "القسم",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: Almarai,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.009,
                        ),
                        DropDownWidget(
                          list: _section.map<DropdownMenuItem<String>>(
                                  (Departments department) {
                                return DropdownMenuItem<String>(
                                    value: department.name,
                                    child:
                                    TEXT(text: department.name, w: w * 0.035));
                              }).toList(),
                          w: w * 0.5,
                          text: 'القسم',
                          selected: _section
                              .firstWhere(
                                  (dept) => dept.id == selectedDepartmentId,
                                  orElse: () => _section[0])
                              .name,
                          onChanged: (value) {
                            setState(() {
                              selectedDepartmentId = _section
                                  .firstWhere((dept) => dept.name == value)
                                  .id;
                            });
                            print(selectedDepartmentId);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff9fa8da),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    padding: EdgeInsets.only(right: w * 0.05),
                    width: double.infinity,

                    child: Row(
                        mainAxisAlignment : MainAxisAlignment.center,
                      children: [
                        Text("معلومات إضافية",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: Almarai,
                              // backgroundColor: Color(0xff9fa8da),
                            )),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                show = !show;
                              });
                            },
                            icon: Icon(
                              Icons.add_outlined,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Visibility(
                    visible: show,
                    child: SizedBox(
                      height: h * 0.65,
                      width: double.infinity,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: h * 0.01,
                              bottom: h * 0.01,
                              left: w * 0.02,
                              right: w * 0.02),
                          child: Column(
                            children: [
                              BoxController(
                                controller: attendance_markController,
                                h: h,
                                w: w,
                                textInputType: TextInputType.number,
                                labelText: 'علامة الحضور',
                                hintText:
                                    widget.subject.attendance_mark != null
                                        ? widget.subject.attendance_mark
                                            .toString()
                                        : "",
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              BoxController(
                                controller: interviews_markController,
                                h: h,
                                w: w,
                                textInputType: TextInputType.number,
                                labelText: 'علامة المقابلة',
                                hintText:
                                    widget.subject.interviews_mark != null
                                        ? widget.subject.interviews_mark
                                            .toString()
                                        : "",
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              BoxController(
                                controller: labs_markController,
                                h: h,
                                w: w,
                                textInputType: TextInputType.number,
                                labelText: 'علامة المخبر',
                                hintText: widget.subject.labs_mark != null
                                    ? widget.subject.labs_mark.toString()
                                    : "",
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              BoxController(
                                controller: tests_markController,
                                h: h,
                                w: w,
                                textInputType: TextInputType.number,
                                labelText: 'علامة المذاكرة',
                                hintText: widget.subject.tests_mark != null
                                    ? widget.subject.tests_mark.toString()
                                    : "",
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              BoxController(
                                controller: homework_markController,
                                h: h,
                                w: w,
                                textInputType: TextInputType.number,
                                labelText: 'علامة الوظيفة',
                                hintText: widget.subject.homework_mark != null
                                    ? widget.subject.homework_mark.toString()
                                    : "",
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              BoxController(
                                  controller: practical_markController,
                                  h: h,
                                  w: w,
                                  textInputType: TextInputType.number,
                                  labelText: 'علامة العملي',
                                  hintText: widget.subject.practical_mark != null
                                      ? widget.subject.practical_mark.toString()
                                      : "",),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              BoxController(
                                  controller: total_markController,
                                  h: h,
                                  w: w,
                                  textInputType: TextInputType.number,
                                  labelText: 'العلامة الكلية',
                                  hintText: widget.subject.total_mark != null
                                      ? widget.subject.total_mark.toString()
                                      : "",),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  BlocConsumer<SubjectCubit, SubjectState>(
                      listener: (context, state) {
                    if (state is SubjectSuccess) {
                      BlocProvider.of<HomeCubit>(context)
                          .updateSubject(state.subject);
                      Get.off(HomeView());
                    }
                    if (state is SubjectFailure) {
                      if (state.errMessage == "401"){
                        Get.offAll(WelcomeView());
                      }
                      debugPrint("kkkSubjectFailure");
                      Flushbar(
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        messageSize: h * 0.02,
                        message: state.errMessage,
                      ).show(context);
                    }
                  }, builder: (context, state) {
                    if (state is SubjectLoading) {
                      return ButtonLoading();
                    } else {
                      return Container(
                        width: double.infinity,
                        child: CustomButtonAuth(
                          text: 'تعديل المادة',
                          onPressed: () {
                            AwesomeDialogWidget.show(
                              context,
                              'هل أنت متأكد من تعديل المادة',
                                  () {
                                    BlocProvider.of<SubjectCubit>(context)
                                        .updateSubject(
                                        subject = Subject(
                                            subject_name:
                                            subjectnameController.text,
                                            academic_year: selectedAcademicYear,
                                            departments: selectedDepartmentId,
                                            tests_mark: tests_markController.text,
                                            attendance_mark:
                                            attendance_markController.text,
                                            interviews_mark:
                                            interviews_markController.text,
                                            homework_mark:
                                            homework_markController.text,
                                            labs_mark: labs_markController.text,
                                            practical_mark:practical_markController.text,
                                            total_mark:total_markController.text
                                        ),
                                        widget.subject.id);
                              },
                            );

                          },
                        ),
                      );
                    }
                  }),

                  BlocConsumer<SubjectCubit, SubjectState>(
                      listener: (context, state) {
                        if (state is SubjectSuccess) {
                          BlocProvider.of<HomeCubit>(context)
                              .updateSubject(state.subject);
                          // setState(() {
                          //   subjects =
                          //       BlocProvider.of<HomeCubit>(context)
                          //           .subject;
                          // });
                        }
                        if (state is SubjectFailure) {

                          Get.off(HomeView());
                          Flushbar(
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.white,
                            messageColor: Colors.black,
                            messageSize: h * 0.02,
                            message: state.errMessage,
                          ).show(context);
                        }
                      }, builder: (context, state) {
                    if (state is SubjectDeleteLoading) {
                      return ButtonLoading();
                    } else {
                      return
                        Container(
                          width: double.infinity,
                          child: CustomButtonAuth(
                            text: 'حذف المادة',
                            onPressed: () {
                              AwesomeDialogWidget.show(
                                context,
                                'هل أنت متأكد من حذف المادة',
                                    () {
                                      BlocProvider.of<SubjectCubit>(context)
                                          .deleteSubject(
                                          widget.subject.id);
                                },
                              );

                            },
                          ),
                        );

                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
