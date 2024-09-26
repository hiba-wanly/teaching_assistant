import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';

class BoxController extends StatefulWidget {
  TextEditingController controller;
  double h;
  double w;
  TextInputType textInputType;
  String labelText ;
  String hintText;

  BoxController({Key? key, required this.controller, required this.h, required this.w, required this.textInputType ,required this.labelText , required this.hintText}) : super(key: key);

  @override
  State<BoxController> createState() => _BoxControllerState();
}

class _BoxControllerState extends State<BoxController> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      textDirection: TextDirection.rtl,
      controller: widget.controller,
      // style: TextStyle(
      //   color: Colors.black,
      //   fontSize: h * 0.018,
      //   fontWeight: FontWeight.w500,
      //     fontFamily: Almarai
      //   // letterSpacing: 0.1,
      // ),
      keyboardType: widget.textInputType,
      decoration:  InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey,fontFamily: Almarai),
        // filled: true,
        label: Container(
            margin:  EdgeInsets.symmetric(horizontal:  widget.w*0.04),
            child:  Text(
              widget.labelText,
              style: TextStyle(
                  // fontSize:  w*0.05,
                  color: Colors.grey,fontFamily: Almarai),
            )),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder:UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
