import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:teachers_marks/features/attendance_log/presentations/views/date_detail_view.dart'; // Import intl package

class PracticalView extends StatefulWidget {
  List<Attendance> listLab;
  int subjectId;
  PracticalView({required this.subjectId ,required this.listLab});
  @override
  State<PracticalView> createState() => _PracticalViewState();
}

class _PracticalViewState extends State<PracticalView> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Expanded(
      child: ListView.builder(
        itemCount: widget.listLab.length,
        itemBuilder: (context, index) {
          // Format the date
          // String formattedDate =
          //     DateFormat('E d/M/y').format(DateTime.parse(widget.listLab[index].date));
          return Card(
            elevation: 3,
            color: Colors.white,
            child: ListTile(
              title: Text(
                textAlign: TextAlign.center,
                widget.listLab[index].date + widget.listLab[index].day, // Display the formatted date
                style:  TextStyle(fontSize: 18,
                  fontFamily: Almarai,),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DateDetailView(attId: widget.listLab[index].id, subjectId: widget.subjectId),
                  ),
                );
              },
            ),
            // Divider(),
          );
        },
      ),
    );
  }
}
