import 'package:another_flushbar/flushbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/core/widgets/drop_down_widget.dart';
import 'package:teachers_marks/core/widgets/loading_page.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:teachers_marks/features/attendance/presentations/manager/attendance_cubit/attendance_cubit.dart';
import 'package:teachers_marks/features/attendance/presentations/manager/attendance_cubit/attendance_state.dart';
import 'package:teachers_marks/features/attendance/presentations/views/practical_view.dart';
import 'package:teachers_marks/features/attendance/presentations/views/theoretical_view.dart';
import 'package:intl/intl.dart' as intl;
import 'package:teachers_marks/features/attendance/presentations/views/widget/awsom.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart';

class AttendanceView extends StatefulWidget {
  Subject subject;
  AttendanceView({super.key, required this.subject});

  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  DateTime? pickedDate;
  DateTime? _selectedDate;
  double h = 1;
  double w = 1;
  bool isPractical = false;
  List<DateTime> practicalDates = [];
  List<DateTime> theoreticalDates = [];
  String formattedDate = '';

  List<Attendance> _attendance = [];
  List<Attendance> _attendanceLab = [];
  List<Attendance> _attendanceTheory = [];

  List<String> _optionType = [
    "lab",
    "theory",
  ];

  void togglePart() {
    setState(() {
      isPractical = !isPractical;
    });
  }

  String? day;
  String? date;
  String? selecttype;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        day = intl.DateFormat('EEEE').format(pickedDate);
        date = intl.DateFormat('y/M/d').format(pickedDate);
        formattedDate = intl.DateFormat('EEE, y/M/d').format(pickedDate);
        if (isPractical) {
          practicalDates.add(pickedDate);
        } else {
          theoreticalDates.add(pickedDate);
        }
        print(formattedDate);
      });
    });
  }
  //   if (pickedDate != null) {
  //     setState(() {
  //       day = intl.DateFormat('EEEE').format(pickedDate!);
  //       date = intl.DateFormat('y/M/d').format(pickedDate!);
  //       formattedDate = intl.DateFormat('EEE, y/M/d').format(pickedDate!);
  //       print(formattedDate);
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AttendanceCubit>(context).getAttendance(widget.subject.id);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(
          w: w,
          text: isPractical ? 'عملي' : 'نظري',
          h: h,
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: h * 0.014, left: w * 0.15, right: w * 0.15),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: !isPractical
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.1, 0.6],
                                tileMode: TileMode.repeated,
                                colors: [kButtonColorBlue1, kButtonColorBlue2],
                              ),
                            )
                          : null,
                      child: TextButton(
                        onPressed: () {
                          if (isPractical) togglePart();
                        },
                        style: TextButton.styleFrom(),
                        child: Text(
                          'نظري',
                          style: TextStyle(
                            fontSize: w * 0.04,
                            fontFamily: Almarai,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: isPractical
                          ? BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [0.1, 0.6],
                                tileMode: TileMode.repeated,
                                colors: [kButtonColorBlue1, kButtonColorBlue2],
                              ),
                            )
                          : null,
                      child: TextButton(
                        onPressed: () {
                          if (!isPractical) togglePart();
                        },
                        style: TextButton.styleFrom(),
                        child: Text(
                          'عملي',
                          style: TextStyle(
                            fontSize: w * 0.04,
                            fontFamily: Almarai,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: h*0.06,),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            BlocConsumer<AttendanceCubit, AttendanceState>(
                listener: (context, state) {
              if (state is AttendanceSuccess) {
                setState(() {
                  formattedDate = '';
                });
              }
              if (state is AttendanceFailure) {
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
              if (state is AttendanceSuccess) {
                _attendanceLab = state.attendanceLab;
                _attendanceTheory = state.attendanceTheroy;
                return isPractical
                    ? PracticalView(
                        subjectId: widget.subject.id, listLab: _attendanceLab)
                    : TheoreticalView(
                        subjectId: widget.subject.id,
                        listTheory: _attendanceTheory);
              } else {
                return LoadingPage();
              }
            }),
            SizedBox(
              height: h * 0.02,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffc5cae9),
          onPressed: () {
            AwesomeDialog(
              context: context,
              borderSide: const BorderSide(color: kButtonColorBlue1, width: 2),
              dialogType: DialogType.noHeader,
              showCloseIcon: true,
              body: DateSelectionDialog(
                initialDate: formattedDate,
                onDateSelected: (newDate) {
                  setState(() {
                    formattedDate = newDate; // Update the main formattedDate
                  });
                },
                onDateSelectedDay: (newDate) {
                  setState(() {
                    day = newDate; // Update the main formattedDate
                  });
                },
                onDateSelectedDate: (newDate) {
                  setState(() {
                    date = newDate; // Update the main formattedDate
                  });
                },
              ),
              // Padding(
              //   padding:EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),                child: Column(
              //     children: [
              //       SizedBox(height: h * 0.01),
              //       InkWell(
              //         onTap: () {
              //
              //            _presentDatePicker();
              //
              //
              //         },
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: [
              //             Icon(Icons.add),
              //             Spacer(),
              //             Text(formattedDate.isNotEmpty ? formattedDate : 'اختر اليوم',
              //                 style: TextStyle(
              //                   fontFamily: Almarai,
              //                 )),
              //           ],
              //         ),
              //       ),
              //       // SizedBox(height: h * 0.02),
              //       // DropDownWidget(
              //       //   list:
              //       //       _optionType.map<DropdownMenuItem<String>>((String att) {
              //       //     return DropdownMenuItem<String>(
              //       //         value: att,
              //       //         child: Text(att,
              //       //             style: TextStyle(
              //       //               fontFamily: Almarai,
              //       //             )));
              //       //   }).toList(),
              //       //   w: w * 0.05,
              //       //   text: 'النوع',
              //       //   selected: selecttype,
              //       //   onChanged: (value) {
              //       //     setState(() {
              //       //       selecttype = value;
              //       //     });
              //       //     print(selecttype);
              //       //   },
              //       // ),
              //       SizedBox(height: h * 0.01),
              //     ],
              //   ),
              // ),
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                debugPrint("update0001");
                if (day != null && date != null) {
                  BlocProvider.of<AttendanceCubit>(context).addAttendance({
                    "subject": widget.subject.id,
                    "date": date,
                    "day": day,
                    "type": isPractical ? 'lab' : 'theory', //selecttype,
                  });
                }
              },
            ).show();
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
