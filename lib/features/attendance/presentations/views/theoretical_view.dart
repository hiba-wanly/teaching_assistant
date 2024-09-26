import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:teachers_marks/features/attendance_log/presentations/views/date_detail_view.dart';

class TheoreticalView extends StatefulWidget {
  List<Attendance> listTheory;
  int subjectId;
  TheoreticalView({required this.subjectId,required this.listTheory});

  @override
  State<TheoreticalView> createState() => _TheoreticalViewState();
}

class _TheoreticalViewState extends State<TheoreticalView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Expanded(
        child: ListView.builder(
            itemCount: widget.listTheory.length,
            itemBuilder: (context, index) {
              // String formattedDate =
              //     DateFormat('E d/M/y').format(DateTime.parse(widget.listTheory[index].date));

              return Card(
                elevation: 3,
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    textAlign: TextAlign.center,
                    widget.listTheory[index].date + widget.listTheory[index].day, // Display the formatted date
                    style:  TextStyle(fontSize: 18,
                      fontFamily: Almarai,),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DateDetailView(
                                attId: widget.listTheory[index].id, subjectId: widget.subjectId)));
                  },
                ),
              );
            }));
  }
}
