import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/awesome_dialog_widget.dart';
import 'package:teachers_marks/core/widgets/loading_page.dart';
import 'package:teachers_marks/features/attendance/presentations/views/attendance_view.dart';
import 'package:teachers_marks/features/attendance_log/data/models/attendance_student_log_model.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_cubit/attendance_log_cubit.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_cubit/attendance_log_state.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_student_log_cubit/attendance_student_log_cubit.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_student_log_cubit/attendance_student_log_state.dart';
import 'package:teachers_marks/features/attendance_log/presentations/views/attendance_log_detail.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_state.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart';

class DateDetailView extends StatefulWidget {
  final int attId;
  int subjectId;
  DateDetailView({super.key, required this.attId, required this.subjectId});

  @override
  State<DateDetailView> createState() => _DateDetailViewState();
}

class _DateDetailViewState extends State<DateDetailView> {
  double h = 1;
  double w = 1;
  TextEditingController _searchController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  late List<AttendanceStudentLog> _contacts = [];

  late List<AttendanceStudentLog> _filteredContacts = [];
  late List<String> selectedIcons = [];

  late List<AttendanceStudentLog> attendanceStudentLog = [];

  List<Map<String, dynamic>> sendData = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AttendanceStudentLogCubit>(context)
        .getAttendanceStudentLog(widget.subjectId, widget.attId);
  }

  late List<AttendanceStudentLog> results = [];

  String _selectedLetter = '';
  void _scrollToLetter(String letter) {
    int index = _filteredContacts
        .indexWhere((contact) => contact.first_name.startsWith(letter));
    print("ooooooooooooooooooooooooooooo");
    print('letttttttttttttttter $letter,indexxxxxxxxxxx $index');
    if (index != -1) {
      _scrollController
          // .animateTo(index*60.0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
          .jumpTo(index * 60.0); // Assuming each item has a height of 60.0
    }
    setState(() {
      _selectedLetter = letter;
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Back arrow icon
            onPressed: () {
              Navigator.of(context).pop(); // Pop the current route
            },
          ),
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
          title: Text('الطلاب (${_contacts.length})',
              style: TextStyle(
                fontFamily: Almarai,
              )),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'بحث',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  context
                      .read<AttendanceStudentLogCubit>()
                      .filterStudents(value);
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            // GestureDetector(
            //   onTap: () {
            //     Get.to(AttendanceLogDetail(attId: widget.attId));
            //   },
            //   child: Container(
            //     height: h * 0.05,
            //     width: w,
            //     margin: EdgeInsets.symmetric(vertical: h * 0.014, horizontal: w * 0.02),
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       border: Border(
            //         right: BorderSide(
            //           color: kButtonColorBlue2,
            //           width: 3,
            //         ),
            //       ),
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.5),
            //           spreadRadius: 2,
            //           blurRadius: 5,
            //           offset: Offset(0, 3),
            //         ),
            //       ],
            //     ),
            //     child: Center(
            //         child: Text(
            //                           "الحضور المسجل",
            //                           style: TextStyle(
            //         fontSize: w*0.04,
            //         fontFamily: Almarai,
            //                           ),
            //                         )),
            //   ),
            // ),
            // SizedBox(height: h*0.09),
            BlocConsumer<AttendanceStudentLogCubit, AttendanceStudentLogState>(
                listener: (context, state) {
              if (state is AttendanceStudentLogFailure) {

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
              if (state is AttendanceStudentLogSuccess) {
                if (selectedIcons.isEmpty) {
                  selectedIcons = List<String>.filled(
                      state.attendanceLog.length, ''); // Initialize once
                }
                // for (int i = 0; i < attendanceLog.length; i++) {
                //   var student = attendanceLog[i];
                //   selectedIcons[i] = student.status; // Adjust according to your model
                // }
                _contacts = state.attendanceLog;

                _filteredContacts = state.attendanceLog;

                print('%%%%%%%%%%%%%%%%%%_filteredContacts');
                print('Contacts $_filteredContacts');

                return Row(
                  children: [
                    Expanded(
                      child: _filteredContacts.isNotEmpty
                          ? SizedBox(
                              height: h,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  controller: _scrollController,
                                  itemCount: _filteredContacts.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          leading: CircleAvatar(
                                            child: Text(
                                                _filteredContacts[index]
                                                    .first_name[0],
                                                style: TextStyle(
                                                  fontFamily: Almarai,
                                                )),
                                          ),
                                          title: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                                _filteredContacts[index]
                                                    .first_name +
                                                    ' ' +
                                                    _filteredContacts[index]
                                                        .father_name +
                                                    ' ' +
                                                    _filteredContacts[index]
                                                        .last_name,
                                                style: TextStyle(
                                                  fontFamily: Almarai,
                                                )),
                                          ),
                                          // trailing: ,
                                          subtitle: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.check_circle,
                                                    color: _filteredContacts[index].status ==
                                                        'attended'
                                                        ? Colors.green
                                                        : Colors.grey),
                                                onPressed: () {
                                                  _filteredContacts[index].status !=
                                                      '' ?
                                                  AwesomeDialogWidget.show(
                                                    context,
                                                    'هل أنت متأكد من تغير حالة الطالب ' +_filteredContacts[index].first_name +" from " +_filteredContacts[index].status+" to "+"attended" ,
                                                        () {
                                                      debugPrint(_filteredContacts[index]
                                                          .student_id.toString());
                                                      setState(() {
                                                        selectedIcons[index] = 'حضور';
                                                        _filteredContacts[index].status =
                                                        'attended' ;
                                                      });
                                                      Map<String, dynamic> data = {
                                                        "attendance": widget.attId,
                                                        "student":
                                                        _filteredContacts[index]
                                                            .student_id,
                                                        "status": "attended"
                                                      };
                                                      bool containsData =
                                                      sendData.any((item) =>
                                                      item['student'] ==
                                                          data['student']);
                                                      if (containsData) {
                                                        sendData.removeWhere((item) =>
                                                        item['student'] ==
                                                            data['student']);
                                                        sendData.add(data);
                                                      } else {
                                                        sendData.add(data);
                                                      }
                                                    },
                                                  ) :  setState(() {
                                                    debugPrint(_filteredContacts[index]
                                                        .student_id.toString());
                                                    selectedIcons[index] = 'حضور';
                                                    _filteredContacts[index].status =
                                                    'attended' ;
                                                    Map<String, dynamic> data = {
                                                      "attendance": widget.attId,
                                                      "student":
                                                      _filteredContacts[index]
                                                          .student_id,
                                                      "status": "attended"
                                                    };
                                                    bool containsData =
                                                    sendData.any((item) =>
                                                    item['student'] ==
                                                        data['student']);
                                                    if (containsData) {
                                                      sendData.removeWhere((item) =>
                                                      item['student'] ==
                                                          data['student']);
                                                      sendData.add(data);
                                                    } else {
                                                      sendData.add(data);
                                                    };
                                                  });


                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.cancel,
                                                    color: _filteredContacts[index].status ==
                                                        '' || _filteredContacts[index].status ==
                                                        'absent'
                                                        ? Colors.red
                                                        : Colors.grey),
                                                onPressed: () {
                                                  _filteredContacts[index].status !=
                                                      '' ? AwesomeDialogWidget.show(
                                                      context,
                                                      'هل أنت متأكد من تغير حالة الطالب ' +_filteredContacts[index].first_name +" from " +_filteredContacts[index].status+" to "+"absent" ,
                                                          () {
                                                        _contacts[index].status != '' ?
                                                        setState(() {
                                                          selectedIcons[index] = 'غياب';
                                                          _filteredContacts[index].status =
                                                          '' ;
                                                          Map<String, dynamic> data = {
                                                            "attendance": widget.attId,
                                                            "student":
                                                            _filteredContacts[index]
                                                                .student_id,
                                                            "status": "absent"
                                                          };
                                                          bool containsData =
                                                          sendData.any((item) =>
                                                          item['student'] ==
                                                              data['student']);
                                                          if (containsData) {
                                                            sendData.removeWhere((item) =>
                                                            item['student'] ==
                                                                data['student']);
                                                            sendData.add(data);
                                                          } else {
                                                            sendData.add(data);
                                                          }
                                                        }) : setState(() {
    selectedIcons[index] = 'غياب';
    _filteredContacts[index].status =
    '' ;
                                                        });

                                                          }) :
                                                  setState(() {
                                                    selectedIcons[index] = 'غياب';
                                                    _filteredContacts[index].status =
                                                    '' ;
                                                  });

                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.info,
                                                    color: _filteredContacts[index].status ==
                                                        'reason'
                                                        ? Colors.blue
                                                        : Colors.grey),
                                                onPressed: () {
                                                  _filteredContacts[index].status !=
                                                      '' ?
                                                  AwesomeDialogWidget.show(
                                                    context,
                                                    'هل أنت متأكد من تغير حالة الطالب ' +_filteredContacts[index].first_name +" from " +_filteredContacts[index].status+" to "+"reason " ,
                                                        () {
                                                      setState(() {
                                                        selectedIcons[index] = 'غياب مبرر';
                                                        _filteredContacts[index].status =
                                                        'reason' ;
                                                      });
                                                      Map<String, dynamic> data = {
                                                        "attendance": widget.attId,
                                                        "student":
                                                        _filteredContacts[index]
                                                            .student_id,
                                                        "status": "reason"
                                                      };
                                                      bool containsData =
                                                      sendData.any((item) =>
                                                      item['student'] ==
                                                          data['student']);
                                                      if (containsData) {
                                                        sendData.removeWhere((item) =>
                                                        item['student'] ==
                                                            data['student']);
                                                        sendData.add(data);
                                                      } else {
                                                        sendData.add(data);
                                                      }
                                                    },
                                                  ):  setState(() {
                                                    selectedIcons[index] = 'غياب مبرر';
                                                    _filteredContacts[index].status =
                                                    'reason' ;
                                                    Map<String, dynamic> data = {
                                                      "attendance": widget.attId,
                                                      "student":
                                                      _filteredContacts[index]
                                                          .student_id,
                                                      "status": "reason"
                                                    };
                                                    bool containsData =
                                                    sendData.any((item) =>
                                                    item['student'] ==
                                                        data['student']);
                                                    if (containsData) {
                                                      sendData.removeWhere((item) =>
                                                      item['student'] ==
                                                          data['student']);
                                                      sendData.add(data);
                                                    } else {
                                                      sendData.add(data);
                                                    };
                                                  });

                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.access_time,
                                                    color: _filteredContacts[index].status ==
                                                        'late'
                                                        ? Colors.orange
                                                        : Colors.grey),
                                                onPressed: () {

                                                  _filteredContacts[index].status !=
                                                      '' ? AwesomeDialogWidget.show(
                                                      context,
                                                      'هل أنت متأكد من تغير حالة الطالب ' +_filteredContacts[index].first_name +" from " +_filteredContacts[index].status+" to "+"late" ,
                                                          () {
                                                        setState(() {
                                                          selectedIcons[index] =
                                                          'متأخر';
                                                          _filteredContacts[index].status =
                                                          'late' ;
                                                        });
                                                        Map<String, dynamic> data = {
                                                          "attendance": widget.attId,
                                                          "student":
                                                          _filteredContacts[index]
                                                              .student_id,
                                                          "status": "late"
                                                        };
                                                        bool containsData =
                                                        sendData.any((item) =>
                                                        item['student'] ==
                                                            data['student']);
                                                        if (containsData) {
                                                          sendData.removeWhere((item) =>
                                                          item['student'] ==
                                                              data['student']);
                                                          sendData.add(data);
                                                        } else {
                                                          sendData.add(data);
                                                        }
                                                      }) :  setState(() {
                                                    _filteredContacts[index].status =
                                                    'late' ;
                                                    selectedIcons[index] =
                                                    'متأخر';
                                                    Map<String, dynamic> data = {
                                                      "attendance": widget.attId,
                                                      "student":
                                                      _filteredContacts[index]
                                                          .student_id,
                                                      "status": "late"
                                                    };
                                                    bool containsData =
                                                    sendData.any((item) =>
                                                    item['student'] ==
                                                        data['student']);
                                                    if (containsData) {
                                                      sendData.removeWhere((item) =>
                                                      item['student'] ==
                                                          data['student']);
                                                      sendData.add(data);
                                                    } else {
                                                      sendData.add(data);
                                                    }
                                                  });

                                                  ;






                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          : Center(child: Text("No contacts available.")),
                    ),
                    Container(
                      width: w * 0.1,
                      height: h,
                      child: ListView(
                        children: 'ابتثجحخدذرزسشصضطظعغفقكلمنهوي'
                            .split('')
                            .map((letter) {
                          return GestureDetector(
                            onTap: () => _scrollToLetter(letter),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(letter,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: _selectedLetter == letter
                                        ? Colors.blue
                                        : Colors.black,
                                    fontFamily: Almarai,
                                  )),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                );
              } else {
                return LoadingPage();
              }
            }),
          ]),
        ),
        floatingActionButton:
            BlocConsumer<AttendanceLogCubit, AttendanceLogState>(
                listener: (context, state) {
          if (state is AttendanceLogFailure) {

            debugPrint("kkkSubjectFailure");
            Flushbar(
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.white,
              messageColor: Colors.black,
              messageSize: h * 0.02,
              message: state.errMessage,
            ).show(context);
          }
          if (state is AttendanceLogStringSuccess) {
            // Get.offAll(HomeView());
            Navigator.of(context).pop();
            Flushbar(
              duration: const Duration(seconds: 3),
              backgroundColor: Colors.white,
              messageColor: Colors.black,
              messageSize: h * 0.02,
              message: state.attendanceLog,
            ).show(context);
          }
        }, builder: (context, state) {
          if (state is AttendanceLogLoading) {
            return FloatingActionButton(
              backgroundColor: Color(0xffc5cae9),
              onPressed: () {},
              child: CircularProgressIndicator(),
            );
          } else {
            return FloatingActionButton(
              backgroundColor: Color(0xffc5cae9),
              onPressed: () {
                if (sendData.isNotEmpty) {
                  BlocProvider.of<AttendanceLogCubit>(context)
                      .addStudentAttendanceLog(sendData);
                }else {
                  Flushbar(
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.white,
                    messageColor: Colors.black,
                    messageSize: h * 0.02,
                    message: "you do not add attendance log ",
                  ).show(context);
                }
              },
              child: Icon(Icons.download),
            );
          }
        }),
      ),
    );
  }
}
