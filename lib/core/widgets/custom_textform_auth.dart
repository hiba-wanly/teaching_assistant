import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomTextFormAuth extends StatefulWidget {
  final String hintText;
  final String labeltext;
  final IconData? iconData;
  final TextEditingController mycontroller;
  TextInputType textInputType;
  bool pass;
  bool ispassword ;
  CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.textInputType,
      required this.pass,
      required this.ispassword,
      });

  @override
  State<CustomTextFormAuth> createState() => _CustomTextFormAuthState();
}

class _CustomTextFormAuthState extends State<CustomTextFormAuth> {

  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only( bottom: MediaQuery.of(context).size.height * 0.05,),
      child: TextFormField(

        controller: widget.mycontroller,
        style: TextStyle(
          fontSize: w*0.05,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'الحقل مطلوب';
          }
          return null;
        },
        keyboardType: widget.textInputType,
        obscureText: widget.pass ? widget.ispassword : false,
        decoration: InputDecoration(
          hintText:widget.hintText,
          hintStyle:  TextStyle(fontSize:  w*0.035,),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:  EdgeInsets.symmetric(vertical: h*0.03, horizontal: w*0.03),
          label: Container(
              margin:  EdgeInsets.symmetric(horizontal: w*0.04),
              child:  Text(
               widget.labeltext,
                style: TextStyle(fontSize:  w*0.05),
              )
          ),
          prefixIcon:  Icon(widget.iconData),
          border: OutlineInputBorder(
            borderSide:const BorderSide( color:kButtonColorBlue2),
            borderRadius: BorderRadius.circular(30),
          ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                color: kButtonColorBlue2, // Change the color here
                width: 2.0,
              ),
            ),
            suffixIcon: widget.pass
                ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.ispassword = !widget.ispassword;
                  });
                },
                icon: Icon(
                  widget.ispassword ? Icons.visibility_off : Icons.visibility,
                  size: MediaQuery.of(context).size.height * 0.02,
                ))
                : null
        ),
      ),
    );
  }
}
