import 'package:flutter/material.dart';
import 'package:teachers_marks/features/home/presentations/views/widgets/rouned_container_widget.dart';

class TLectuerCard extends StatefulWidget {
  final bool showBorder;
  final void Function()? onTap;

  const TLectuerCard({super.key, required this.showBorder, this.onTap});

  @override
  State<TLectuerCard> createState() => _TLectuerCardState();
}

class _TLectuerCardState extends State<TLectuerCard> {
  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return GestureDetector(
      onTap: widget.onTap,
      child: TRounedContainer(
        showBorder:widget.showBorder,
        backgroundColor:const Color(0x24862525),
        padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05),
        // all(30),
        child:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("تصميمlsssssssss\n"
                "sssssss")
          ],
        )
      ) ,
    );
  }
}
