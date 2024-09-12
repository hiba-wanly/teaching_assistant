import 'package:flutter/material.dart';

import '../../constants.dart';

class ButtonLoading extends StatefulWidget {
  // final void Function()? onPressed;
  const ButtonLoading({super.key});

  @override
  State<ButtonLoading> createState() => _ButtonLoadingState();
}

class _ButtonLoadingState extends State<ButtonLoading> {
  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02,),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [kButtonColorBlue1, kButtonColorBlue2],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.1, 0.6],
          tileMode: TileMode.repeated,
        ),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      // child: MaterialButton(
      //   onPressed: (){},
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //   padding:  EdgeInsets.symmetric(vertical: h*0.02),
      //   // color: const Color(0x24F10808),
      //   // textColor: Colors.white,
      //
      //   child: const Align(
      //     alignment: Alignment.center,
      //     child: CircularProgressIndicator(),
      //   ),
      // ),
    );
  }
}

// 0x244A61B0
