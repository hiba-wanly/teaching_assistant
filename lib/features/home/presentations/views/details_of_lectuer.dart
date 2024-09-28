import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/features/add_subject/data/models/subject_model.dart';
import 'package:teachers_marks/features/attendance/presentations/views/attendance_view.dart';
import 'package:teachers_marks/features/lecturer/presentations/views/lecturer_subject.dart';

class LectuerDetails extends StatefulWidget {
  Subject subject;
  LectuerDetails({super.key, required this.subject});

  @override
  State<LectuerDetails> createState() => _LectuerDetailsState();
}

class _LectuerDetailsState extends State<LectuerDetails> {
  double h = 1;
  double w = 1;
  late final List<Map<String, dynamic>> items;

  @override
  void initState() {
    super.initState();
    items = [
      {
        'name': 'المحاضرين المشاركين',
        'screen': LecturerSubject(subject: widget.subject)
      },
      {'name': 'الحضور', 'screen': AttendanceView(subject: widget.subject)},
    ];
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: CustomAppBar(text: widget.subject.subject_name, h: h, w: w),
            body: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => items[index]['screen']),
                    );
                  },
                  child: Container(
                    height: h * 0.15,
                    margin: EdgeInsets.symmetric(
                        vertical: h * 0.014, horizontal: w * 0.04),
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
                    child: Center(
                        child: Text(
                      items[index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: Almarai,
                      ),
                    )),
                  ),
                );
              },
            )));
  }
}
