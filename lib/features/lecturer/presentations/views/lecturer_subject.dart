import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/core/widgets/drop_down_widget.dart';
import 'package:teachers_marks/core/widgets/loading_page.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/departments/data/models/lecturer_model.dart';
import 'package:teachers_marks/features/departments/presentations/manager/lucturer_cubit/lecturer_cubit.dart';
import 'package:teachers_marks/features/lecturer/presentations/manager/lecturer_cubit/lecturer_subject_cubit.dart';
import 'package:teachers_marks/features/lecturer/presentations/manager/lecturer_cubit/lecturer_subject_state.dart';

class LecturerSubject extends StatefulWidget {
  Subject subject;
  LecturerSubject({super.key, required this.subject});

  @override
  State<LecturerSubject> createState() => _LecturerSubjectState();
}

class _LecturerSubjectState extends State<LecturerSubject> {
  double h = 1;
  double w = 1;
  List<Lecturer> _lecturer = [];

  List<Lecturer> _lecturerSubject = [];

  late String? dropdownLecturerValue;

  int? selectedLecturerId;

  int? loadingIndex;

  String? selectedLecturer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LecturerSubjectCubit>(context)
        .getLecturer(widget.subject.id);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    _lecturer = BlocProvider.of<LecturerCubit>(context).lecturer;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          h: h,
          text: "المحاضرين",
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: h * 0.01,
              bottom: h * 0.01,
              left: w * 0.02,
              right: w * 0.02),
          child: Card(
            shadowColor: Colors.grey,
            elevation: 6,
            color: Color(0xffe8eaf6),
            child: BlocConsumer<LecturerSubjectCubit, LecturerSubjectState>(
                listener: (context, state) {
                  if (state is LecturerSubjectSuccess){
                    setState(() {
                      selectedLecturer = null;
                      selectedLecturerId =null;
                    });
                  }
              if (state is LecturerSubjectFailure) {
                debugPrint("kkkSubjectFailure");
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
              if (state is LecturerSubjectSuccess) {

                _lecturerSubject = state.lecturerS;
                return  ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: h * 0.01,
                          bottom: h * 0.01,
                          left: w * 0.02,
                          right: w * 0.02),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.5,
                            width: double.infinity,
                            child: Card(
                              elevation: 3,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: h * 0.01,
                                    bottom: h * 0.01,
                                    left: w * 0.02,
                                    right: w * 0.02),
                                child: ListView.builder(
                                  itemCount: _lecturerSubject.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        textAlign: TextAlign.center,
                                        _lecturerSubject[index].name,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: Almarai),
                                      ),
                                      leading: BlocConsumer<
                                              LecturerSubjectCubit,
                                              LecturerSubjectState>(
                                          listener: (context, state) {
                                        if (state is LecturerSubjectSuccess) {
                                          _lecturerSubject = state.lecturerS;

                                        //   // BlocProvider.of<HomeCubit>(context)
                                        //   //     .updateSubject(state.subject);
                                        //   // setState((){
                                        //   //   subjects = BlocProvider
                                        //   //       .of<HomeCubit>(context).subject;
                                        //   // });
                                        //
                                        //   // update list of subject
                                        //   // Get.off(HomeView());
                                        }
                                        if (state is LecturerSubjectFailure) {
                                          // debugPrint("kkkSubjectFailure");
                                          Flushbar(
                                            duration:
                                                const Duration(seconds: 3),
                                            backgroundColor: Colors.white,
                                            messageColor: Colors.black,
                                            messageSize: h * 0.02,
                                            message: state.errMessage,
                                          ).show(context);
                                          // Navigator.pop(context);
                                        }
                                      }, builder: (context, state) {
                                        if (state is LecturerSubjectLoading) {
                                          return InkWell(
                                            onTap: () {},
                                            child: loadingIndex == index
                                                ? CircularProgressIndicator(
                                                    color: Colors.blue)
                                                : Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                          );
                                        } else {
                                          return IconButton(
                                            onPressed: () {
                                              setState(() {
                                                loadingIndex =
                                                    index; // Track the pressed button
                                              });
                                              BlocProvider.of<
                                                          LecturerSubjectCubit>(
                                                      context)
                                                  .deleteLecturer(
                                                      widget.subject.id,
                                                      _lecturerSubject[index]
                                                          .id);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Color(0xffB26361),
                                            ),
                                          );
                                        }
                                      }),

                                      // Icon(Icons.delete,color: Color(0xffB26361),),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: h * 0.5,
                          ),
                          Text(
                            "المحاضرين المتاحبن*",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: Almarai,
                            ),
                          ),
                          SizedBox(
                            width: h * 0.05,
                          ),
                          DropDownWidget(
                            list: _lecturer.isEmpty
                                ? []
                                : _lecturer
                                .map<DropdownMenuItem<String>>(
                                    (Lecturer lec) {
                              return DropdownMenuItem<String>(
                                  value: lec.name,
                                  child: Text(lec.name,
                                      style: TextStyle(
                                        fontFamily: Almarai,
                                      )));
                            }).toList(),
                            w: w * 0.5,
                            text: 'المحاضر',
                            selected: selectedLecturer,
              // _lecturer.isNotEmpty && selectedLecturerId != null
              //                   ?
                            // _lecturer.firstWhere((dept) => dept.id == selectedLecturerId, orElse: () => _lecturer[0]).name
                            // _lecturer.isNotEmpty && selectedLecturerId != null
                            //     ? _lecturer
                            //     .firstWhere(
                            //         (lect) =>
                            //     lect.id == selectedLecturerId,
                            //     orElse: () => _lecturer[0])
                            //     .name // Make sure this references the unique identifier
                            //     : null,




                            onChanged: (value) {
                              setState(() {
                                selectedLecturer = value;
                                selectedLecturerId = _lecturer
                                    .firstWhere(
                                        (dept) => dept.name == value)
                                    .id;
                              });
                              if(_lecturerSubject.any((lecturer) => lecturer.id == selectedLecturerId)){

                              }else{
                                BlocProvider.of<LecturerSubjectCubit>(context)
                                    .addLecturer({
                                  "subject":widget.subject.id,
                                  "lecturer":selectedLecturerId
                                });
                              }

                              print(selectedLecturerId);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else
                return LoadingPage();
            }),
          ),
        ),
      ),
    );
  }
}
