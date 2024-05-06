import 'package:flutter/material.dart';
import 'package:teachers_marks/constants.dart';

class LogoAuth extends StatefulWidget {
  const LogoAuth({super.key});

  @override
  State<LogoAuth> createState() => _LogoAuthState();
}

class _LogoAuthState extends State<LogoAuth> {

  double h =1;
  double w=1 ;

  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return  Container(
      margin:  EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.02,
          bottom: MediaQuery.of(context).size.height * 0.02,
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02
          // bottom: 40,left: 40,right: 40
      ),
      child: ClipRRect(
          borderRadius:
          const  BorderRadius.all(Radius.circular(80)), // Image radius
          child: Image.asset(
            AppImagesAssets.logo,
            height: h*0.3,
            width: w*0.55,
            fit: BoxFit.cover,
          )),
    );
  }
}
