import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:teachers_marks/core/widgets/text_style.dart';

import '../../constants.dart';

class AwesomeDialogWidget{
  static void show(BuildContext context, String message, void Function()? onPressed) {
    AwesomeDialog(
      context: context,
      borderSide: const BorderSide(color: kButtonColorBlue1, width: 2),
      dialogType: DialogType.noHeader,
      showCloseIcon: true,
      body: Padding(
        padding:EdgeInsets.all(MediaQuery.of(context).size.width * 0.035),
        child: TEXT(text: message, w: MediaQuery.of(context).size.width * 0.035),
      ),
      btnCancelOnPress: () {},
      btnOkOnPress: onPressed,
    ).show();
  }
}


//     extends StatefulWidget {
//   String t;
//   final void Function()? onPressed;
//    AwesomeDialogWidget({Key? key , this.onPressed, required this.t}) : super(key: key);
//
//   @override
//   State<AwesomeDialogWidget> createState() => _AwesomeDialogWidgetState();
// }
//
// class _AwesomeDialogWidgetState extends State<AwesomeDialogWidget> {
//   double h =1;
//   double w=1 ;
//   void _showDialog() {
//     AwesomeDialog(
//       context: context,
//       borderSide: const BorderSide(color: kButtonColorGreen1, width: 2),
//       dialogType: DialogType.noHeader,
//       showCloseIcon: true,
//       body: TEXT(text: widget.t, w: w * 0.035),
//       btnCancelOnPress: () {},
//       btnOkOnPress: widget.onPressed,
//     ).show();
//   }

//   @override
//   Widget build(BuildContext context) {
//     h = MediaQuery.of(context).size.height;
//     w = MediaQuery.of(context).size.width;
//     return  ElevatedButton(
//       onPressed: _showDialog, // Call the function to show the dialog
//       child: Text("Show Dialog"), // Replace with your desired button text
//     );
//   }
// }
