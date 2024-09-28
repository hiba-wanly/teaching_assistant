import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/loading_page.dart';
import 'package:teachers_marks/features/attendance/presentations/views/attendance_view.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_cubit/attendance_log_cubit.dart';
import 'package:teachers_marks/features/attendance_log/presentations/manager/attendance_cubit/attendance_log_state.dart';
import 'package:teachers_marks/features/attendance_log/presentations/views/attendance_log_detail.dart';
import 'package:teachers_marks/features/departments/data/models/student_model.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_cubit.dart';
import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_state.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';

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
  late List<Student> _contacts = [];

  late List<Student> _filteredContacts = [];
  late List<String> selectedIcons = [];

  List<Map<String, dynamic>> sendData = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<StudentCubit>(context).getStudentData(widget.subjectId);
  }

  late List<Student> results = [];

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
                  context.read<StudentCubit>().filterStudents(value);
                },
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.to(AttendanceLogDetail(attId: widget.attId));
              },
              child: Container(
                height: h * 0.05,
                width: w,
                margin: EdgeInsets.symmetric(vertical: h * 0.014, horizontal: w * 0.02),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: kButtonColorBlue2,
                      width: 3,
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
                child: Center(
                    child: Text(
                                      "الحضور المسجل",
                                      style: TextStyle(
                    fontSize: w*0.04,
                    fontFamily: Almarai,
                                      ),
                                    )),
              ),
            ),
            // SizedBox(height: h*0.09),
            BlocConsumer<StudentCubit, StudentState>(
                listener: (context, state) {
              if (state is StudentFailure) {
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
              if (state is StudentSuccess) {
                if (selectedIcons.isEmpty) {
                  selectedIcons = List<String>.filled(
                      state.student.length, ''); // Initialize once
                }
                _contacts = state.student;

                _filteredContacts = _contacts;

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
                                                    color: selectedIcons[index] ==
                                                            'حضور'
                                                        ? Colors.green
                                                        : Colors.grey),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedIcons[index] = 'حضور';
                                                  });
                                                  Map<String, dynamic> data = {
                                                    "attendance": widget.attId,
                                                    "student":
                                                        _filteredContacts[index]
                                                            .id,
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
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.cancel,
                                                    color: selectedIcons[index] ==
                                                            'غياب'
                                                        ? Colors.red
                                                        : Colors.grey),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedIcons[index] = 'غياب';
                                                  });
                                                  Map<String, dynamic> data = {
                                                    "attendance": widget.attId,
                                                    "student":
                                                        _filteredContacts[index]
                                                            .id,
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
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.info,
                                                    color: selectedIcons[index] ==
                                                            'غياب مبرر'
                                                        ? Colors.blue
                                                        : Colors.grey),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedIcons[index] =
                                                        'غياب مبرر';
                                                  });
                                                  Map<String, dynamic> data = {
                                                    "attendance": widget.attId,
                                                    "student":
                                                        _filteredContacts[index]
                                                            .id,
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
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.access_time,
                                                    color: selectedIcons[index] ==
                                                            'متأخر'
                                                        ? Colors.orange
                                                        : Colors.grey),
                                                onPressed: () {
                                                  setState(() {
                                                    selectedIcons[index] =
                                                        'متأخر';
                                                  });
                                                  Map<String, dynamic> data = {
                                                    "attendance": widget.attId,
                                                    "student":
                                                        _filteredContacts[index]
                                                            .id,
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
            Get.offAll(HomeView());
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
                }
              },
              child: Icon(Icons.add),
            );
          }
        }),
      ),
    );
  }
}
