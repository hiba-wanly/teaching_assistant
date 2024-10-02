import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButtonAuth extends StatefulWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({super.key, required this.text, this.onPressed});

  @override
  State<CustomButtonAuth> createState() => _CustomButtonAuthState();
}

class _CustomButtonAuthState extends State<CustomButtonAuth> {
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
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white,
          width: 2.0,
        ),
      ),
      child: MaterialButton(
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding:  EdgeInsets.symmetric(vertical: h*0.02),
        // color: const Color(0x24F10808),
        textColor: Colors.white,
        child: Text(widget.text ,
          style: TextStyle(
            color: Colors.black,
              fontFamily: Almarai),
          ),
      ),
    );
  }
}

// 0x244A61B0
