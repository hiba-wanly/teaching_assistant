import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:adoptive_calendar/adoptive_calendar.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/features/attendance/presentations/views/date_detail_view.dart';
import 'package:teachers_marks/features/attendance/presentations/views/practical_view.dart';
import 'package:teachers_marks/features/attendance/presentations/views/theoretical_view.dart';
import 'package:intl/intl.dart' as intl;

class AttendanceView extends StatefulWidget {
  @override
  _AttendanceViewState createState() => _AttendanceViewState();
}

class _AttendanceViewState extends State<AttendanceView> {
  DateTime? pickedDate;
  DateTime? _selectedDate;
  double h = 1;
  double w = 1;
  bool isPractical = true;
  List<DateTime> practicalDates = [];
  List<DateTime> theoreticalDates = [];
  String formattedDate='';

  void togglePart() {
    setState(() {
      isPractical = !isPractical;
    });
  }


  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
         formattedDate = intl.DateFormat('EEE, M/d/y').format(pickedDate);
        if (isPractical) {
          practicalDates.add(pickedDate);
        } else {
          theoreticalDates.add(pickedDate);
        }
        // Display the formatted date
        print(formattedDate);
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: CustomAppBar(text:  isPractical ? 'عملي' : 'نظري', h: h,),

        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 8, left: w * 0.15, right: w * 0.15),
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
                        style: TextButton.styleFrom(
                            // backgroundColor: isPractical ? Colors.red : Colors.white,
                            ),
                        child: Text(
                          'عملي',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: h*0.06,),
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
                        style: TextButton.styleFrom(
                            // backgroundColor: isPractical ? Colors.white : Colors.red,
                            ),
                        child: Text(
                          'نظري',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: h*0.01,),
            isPractical
                ? PracticalView(selectedDates: practicalDates)
                : TheoreticalView(selectedDates: theoreticalDates),
            // SizedBox(height: h*0.06,)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffc5cae9),
          onPressed: _presentDatePicker,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}




