import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatefulWidget {
  final String hintText;
  final String labeltext;
  final IconData? iconData;
  // final TextEditingController mycontroller;
  const CustomTextFormAuth(
      {super.key,
      required this.hintText,
      required this.labeltext,
      required this.iconData,
      // required this.mycontroller
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
        // controller: mycontroller,
        style: TextStyle(
          fontSize: w*0.05,
        ),
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
              )),
          prefixIcon:  Icon(widget.iconData),
          border: OutlineInputBorder(
            borderSide:const BorderSide( color:Color(0xffbdb9b9)),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
