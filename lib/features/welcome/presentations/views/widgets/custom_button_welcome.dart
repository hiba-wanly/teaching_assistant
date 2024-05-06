import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';

class CustomButtonWelcome extends StatefulWidget {
  final IconData prefixIcon;
  final String text;
  final VoidCallback? onPressed;
  const CustomButtonWelcome(
      {super.key,
      required this.prefixIcon,
      required this.text,
      this.onPressed});

  @override
  State<CustomButtonWelcome> createState() => _CustomButtonWelcomeState();
}

class _CustomButtonWelcomeState extends State<CustomButtonWelcome> {

  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {


    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      margin:  EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05
        ),
      // padding: const EdgeInsets.all(16),
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.05,
          right: MediaQuery.of(context).size.width * 0.05),

      decoration: BoxDecoration(
        color: kButtonColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(widget.prefixIcon), // Prefix icon
           SizedBox(width: w*0.04),
          Expanded(
            child: Text(
              widget.text,
              style:  TextStyle(fontSize: w*0.05, fontWeight: FontWeight.w400),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.arrow_forward_ios), onPressed: widget.onPressed),
        ],
      ),
    );
  }
}
