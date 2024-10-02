import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/awesome_dialog_widget.dart';
import 'package:teachers_marks/features/attendance/data/models/attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:teachers_marks/features/attendance/presentations/manager/attendance_cubit/attendance_cubit.dart';
import 'package:teachers_marks/features/attendance/presentations/manager/attendance_cubit/attendance_state.dart';
import 'package:teachers_marks/features/attendance_log/presentations/views/date_detail_view.dart';
import 'package:teachers_marks/features/welcome/presentations/views/welcome_views.dart'; // Import intl package

class PracticalView extends StatefulWidget {
  List<Attendance> listLab;
  int subjectId;
  PracticalView({required this.subjectId, required this.listLab});
  @override
  State<PracticalView> createState() => _PracticalViewState();
}

class _PracticalViewState extends State<PracticalView> {
  double h = 1;
  double w = 1;
  int? loadingIndex;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Expanded(
      child: widget.listLab.isEmpty
          ? Center(child: Text("No data available"))
          : ListView.builder(
        itemCount: widget.listLab.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            color: Colors.white,
            child: ListTile(
              title: Row(
                mainAxisAlignment : MainAxisAlignment.spaceAround,
                children: [
                  BlocConsumer<AttendanceCubit, AttendanceState>(
                      listener: (context, state) {
                        if (state is AttendanceSuccess) {
                          setState(() {
                            widget.listLab = state.attendanceLab;
                          });
                        }
                        if (state is AttendanceFailure) {

                          Flushbar(
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.white,
                            messageColor: Colors.black,
                            messageSize: h * 0.02,
                            message: state.errMessage,
                          ).show(context);
                        }
                      }, builder: (context, state) {
                    if (state is AttendanceDeleteLoading) {
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
                      return InkWell(
                        onTap: () {
                          AwesomeDialogWidget.show(
                            context,
                            'هل أنت متأكد من حذف حضور العملي',
                                () {
                              setState(() {
                                loadingIndex =
                                    index; // Track the pressed button
                              });
                              BlocProvider.of<AttendanceCubit>(context)
                                  .deleteAttendance(
                                  widget.listLab[index].id);
                            },
                          );

                          // debugPrint("clicked");
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      );
                    }
                  }),

                  Text(
                    textAlign: TextAlign.center,
                    widget.listLab[index].date +" "+
                        widget.listLab[index].day, // Display the formatted date
                    style: TextStyle(
                      fontSize: w * 0.04,
                      fontFamily: Almarai,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DateDetailView(
                        attId: widget.listLab[index].id,
                        subjectId: widget.subjectId),
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
