import 'package:flutter/material.dart';

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
      child: MaterialButton(
        onPressed: widget.onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding:  EdgeInsets.symmetric(vertical: h*0.02),
        color: const Color(0x24F10808),
        textColor: Colors.white,
        child: Text(widget.text),
      ),
    );
  }
}

// 0x244A61B0
