import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
import 'package:teachers_marks/features/attendance/presentations/views/attendance_view.dart';

class LectuerDetails extends StatefulWidget {
  const LectuerDetails({super.key});

  @override
  State<LectuerDetails> createState() => _LectuerDetailsState();
}

class _LectuerDetailsState extends State<LectuerDetails> {
  double h = 1;
  double w = 1;
  final List<Map<String, dynamic>> items = [
    {'name': 'الحضور', 'screen': AttendanceView()},
    // {'name': 'Item 2', 'screen': Screen2()},
    // {'name': 'Item 3', 'screen': Screen3()},
    // {'name': 'Item 4', 'screen': Screen4()},
    // {'name': 'Item 5', 'screen': Screen5()},
  ];
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: CustomAppBar(text: "طرائق", h: h,),
          // AppBar(
          //   title: Text("طرائق"),
          //   flexibleSpace: Container(
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.bottomLeft,
          //         end: Alignment.topRight,
          //         stops: [0.1, 0.6],
          //         tileMode: TileMode.repeated,
          //         colors: [kButtonColorBlue1, kButtonColorBlue2],
          //       ),
          //     ),
          //   ),
          // ),
          body:



          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => items[index]['screen']),
                  );
                },
                child: Container(
                height: h * 0.15,
                margin: EdgeInsets.symmetric(
                    vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(

                      color: Colors.blue,
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
                  child: Center(child: Text(items[index]['name'],
                    style: TextStyle(fontSize: 18),)),
                ),
              );
            },
          )











            // ListView.builder(
            //   itemCount: items.length,
            //   itemBuilder: (context, index) {
            //     return InkWell(
            //       onTap: () {},
            //       child: Container(
            //           height: h * 0.15,
            //           margin: EdgeInsets.symmetric(
            //               vertical: 10, horizontal: 20),
            //           padding: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             border: Border(
            //               right: BorderSide(
            //
            //                 color: Colors.blue,
            //                 width: 6,
            //               ),
            //             ),
            //             color: Colors.white,
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey.withOpacity(0.5),
            //                 spreadRadius: 2,
            //                 blurRadius: 5,
            //                 offset: Offset(0, 3),
            //               ),
            //             ],
            //           ),
            //           child: Center(
            //             child: Text("حضور", style: TextStyle(fontSize: 18),),
            //           )),
            //     );
            //   }),
        ));
  }
}
