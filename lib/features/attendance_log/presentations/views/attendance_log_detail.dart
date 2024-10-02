// import 'package:another_flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:teachers_marks/constants.dart';
// import 'package:teachers_marks/core/widgets/loading_page.dart';
// import 'package:teachers_marks/features/attendance_log/data/models/attendance_log_model.dart';
// import 'package:teachers_marks/features/attendance_log/presentations/manager/files_cubit/attendance_log_cubit.dart';
// import 'package:teachers_marks/features/attendance_log/presentations/manager/files_cubit/attendance_log_state.dart';
// import 'package:teachers_marks/features/departments/data/models/student_model.dart';
// import 'package:teachers_marks/features/departments/presentations/manager/student_cubit/student_cubit.dart';
//
// class AttendanceLogDetail extends StatefulWidget {
//   int attId;
//   AttendanceLogDetail({Key? key, required this.attId}) : super(key: key);
//
//   @override
//   State<AttendanceLogDetail> createState() => _AttendanceLogDetailState();
// }
//
// class _AttendanceLogDetailState extends State<AttendanceLogDetail> {
//   double h = 1;
//   double w = 1;
//   List<Student> student = [];
//   List<AttendanceLog> attendanceLog = [];
//   TextEditingController _searchController = TextEditingController();
//   late List<Student> _filteredContacts = [];
//   ScrollController _scrollController = ScrollController();
//
//   void _filterContacts(String query) {
//     setState(() {
//       _filteredContacts = student
//           .where((contact) =>
//               contact.first_name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//       print('Filtered $_filteredContacts');
//     });
//   }
//
//   void _scrollToLetter(String letter) {
//     int index = _filteredContacts
//         .indexWhere((contact) => contact.first_name.startsWith(letter));
//     if (index != -1) {
//       _scrollController
//           .jumpTo(index * 60.0); // Assuming each item has a height of 60.0
//     }
//   }
//
//   void initState() {
//     super.initState();
//     BlocProvider.of<AttendanceLogCubit>(context)
//         .getStudentAttendanceLog(widget.attId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back), // Back arrow icon
//             onPressed: () {
//               Navigator.of(context).pop(); // Pop the current route
//             },
//           ),
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomLeft,
//                 end: Alignment.topRight,
//                 stops: [0.1, 0.6],
//                 tileMode: TileMode.repeated,
//                 colors: [kButtonColorBlue1, kButtonColorBlue2],
//               ),
//             ),
//           ),
//           title: Text('الطلاب المسجلين(${attendanceLog.length})',
//               style: TextStyle(
//                 fontFamily: Almarai,
//               )),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(48.0),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'بحث',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   prefixIcon: Icon(Icons.search),
//                 ),
//                 onChanged: _filterContacts,
//               ),
//             ),
//           ),
//         ),
//         body: BlocConsumer<AttendanceLogCubit, AttendanceLogState>(
//             listener: (context, state) {
//           if (state is AttendanceLogFailure) {
//             debugPrint("kkkSubjectFailure");
//             Flushbar(
//               duration: const Duration(seconds: 3),
//               backgroundColor: Colors.white,
//               messageColor: Colors.black,
//               messageSize: h * 0.02,
//               message: state.errMessage,
//             ).show(context);
//             // Navigator.pop(context);
//           }
//         }, builder: (context, state) {
//           if (state is AttendanceLogSuccess) {
//             attendanceLog = state.attendanceLog;
//             student = BlocProvider.of<StudentCubit>(context).student;
//             _filteredContacts = student;
//             // selectedIcons = List<String>.filled(
//             //     _filteredContacts.length, ''); // Initialize with empty strings
//
//             print('Contacts $_filteredContacts');
//
//             return Row(
//               // mainAxisSize: MainAxisSize.min,
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     controller: _scrollController,
//                     itemCount: attendanceLog.length,
//                     itemBuilder: (context, index) {
//                       // Find the corresponding student
//                       final studentId = attendanceLog[index].student_id;
//                       final studentData = _filteredContacts.firstWhere(
//                         (s) => s.id == studentId,
//                         orElse: () => Student(id: -1, first_name: 'Unknown'),
//                       );
//                       return Column(
//                         children: [
//                           ListTile(
//                             leading: CircleAvatar(
//                               child: Text(studentData.first_name[0],
//                                   style: TextStyle(
//                                     fontFamily: Almarai,
//                                   )),
//                             ),
//                             title: FittedBox(
//                               fit: BoxFit.scaleDown,
//                               child: Text(studentData.first_name,
//                                   style: TextStyle(
//                                     fontFamily: Almarai,
//                                   )),
//                               // alignment: Alignment.center,
//                             ),
//                             // trailing: ,
//                             subtitle: Row(
//                               // mainAxisSize: MainAxisSize/.,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 IconButton(
//                                   // constraints: BoxConstraints(),
//                                   // iconSize:20,
//                                   // padding: EdgeInsets.all(0),
//                                   icon: Icon(Icons.check_circle,
//                                       color: attendanceLog[index].status ==
//                                               'attended'
//                                           ? Colors.green
//                                           : Colors.grey),
//                                   onPressed: () {},
//                                 ),
//                                 IconButton(
//                                   // constraints: BoxConstraints(),
//                                   // iconSize:20,
//                                   // padding: EdgeInsets.all(0),
//                                   icon: Icon(Icons.cancel,
//                                       color: attendanceLog[index].status ==
//                                               'absent'
//                                           ? Colors.red
//                                           : Colors.grey),
//                                   onPressed: () {},
//                                 ),
//                                 IconButton(
//                                   // constraints: BoxConstraints(),
//                                   // iconSize:20,
//                                   // padding: EdgeInsets.all(0),
//                                   icon: Icon(Icons.info,
//                                       color: attendanceLog[index].status ==
//                                               'reason'
//                                           ? Colors.blue
//                                           : Colors.grey),
//                                   onPressed: () {},
//                                 ),
//                                 IconButton(
//                                   // constraints: BoxConstraints(),
//                                   // iconSize:20,
//                                   // padding: EdgeInsets.all(0),
//                                   icon: Icon(Icons.access_time,
//                                       color:
//                                           attendanceLog[index].status == 'late'
//                                               ? Colors.orange
//                                               : Colors.grey),
//                                   onPressed: () {},
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Divider(),
//                         ],
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   width: w * 0.1,
//                   child: ListView(
//                     children:
//                         'ابتثجحخدذرزسشصضطظعغفقكلمنهوي'.split('').map((letter) {
//                       return GestureDetector(
//                         onTap: () => _scrollToLetter(letter),
//                         child: Padding(
//                           padding: const EdgeInsets.all(2.0),
//                           child: Text(letter,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontFamily: Almarai,
//                               )),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             );
//           } else {
//             return LoadingPage();
//           }
//         }),
//       ),
//     );
//   }
// }
