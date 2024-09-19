import 'package:flutter/material.dart';
import 'package:teachers_marks/core/widgets/custom_appbar.dart';
class AddSubjectView extends StatefulWidget {
  const AddSubjectView({super.key});

  @override
  State<AddSubjectView> createState() => _AddSubjectViewState();
}

class _AddSubjectViewState extends State<AddSubjectView> {
  double h = 1;
  double w = 1;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
appBar: CustomAppBar(h: h,text: "إضافة مادة",),
      body: MyCustomForm(),
    ));
  }
}
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  double h = 1;
  double w = 1;
  final _formKey = GlobalKey<FormState>();
  List<String> _academicYear=[
    'السنة الأولى',
    'السنة الثانية',
    'السنة الثالثة',
    'السنة الرابعة',
    'السنة الخامسة',
  ];
  late String? dropdownAcademicValue=_academicYear[0];

  List<String> _section=[
    'هندسة التصميم الميكاني والانتاج',
   'ميكانيك',
   'تصميم',
   ' و تحكم الي وحواسيب',

  ];
  late String? dropdownSectionValue=_section[0];

  bool show = false ;


  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Expanded(
          child: Padding(
        padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01,left: w*0.02,right: w*0.02),
         child: Card(
           shadowColor: Colors.grey,
           elevation: 6,
           // color: Color(0xffede7f6),
           color: Color(0xffe8eaf6),
           child: ListView(
             children: [
               Padding(
                   padding: EdgeInsets.only(top: h*0.01,bottom: h*0.01,left: w*0.02,right: w*0.02),
                   child: Column(
                     children: [
                       TextFormField(
                         decoration: InputDecoration(
                           labelText: 'اسم المادة*' ,
                           labelStyle: TextStyle(
                             color: Colors.grey,
                           ),
                           enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.grey,
                             )
                           )
                         ),
                       ),
                       SizedBox(height: h*0.02,),
                       Container(
                         child: Row(
                           children: [
                             Text("السنة الدراسية*",style: TextStyle(color: Colors.grey,),),
                             SizedBox(width: w*0.05,),
                             DropdownButton<String>(
                               // hint: Text(''),
                                 items:
                                 // _dropdownMenuItems,
                                 _academicYear.map<DropdownMenuItem<String>>((String value){
                                   return DropdownMenuItem<String>(
                                       value: value,
                                       child: Text(value));
                                 }).toList(),
                                 onChanged: (String? value){
                                   setState(() {
                                     dropdownAcademicValue=value;
                                   });
                                 },
                               value: dropdownAcademicValue,
                               icon: Icon(Icons.arrow_drop_down),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: h*0.02,),
                       Container(
                         child: Row(
                           children: [
                             Text("القسم*",style: TextStyle(color: Colors.grey,),),
                             SizedBox(width: w*0.05,),
                             DropdownButton<String>(
                               // hint: Text(''),
                               items:
                               // _dropdownMenuItems,
                               _section.map<DropdownMenuItem<String>>((String value){
                                 return DropdownMenuItem<String>(
                                     value: value,
                                     child: Text(value));
                               }).toList(),
                               onChanged: (String? value){
                                 setState(() {
                                   dropdownSectionValue=value;
                                 });
                               },
                               value: dropdownSectionValue,
                               icon: Icon(Icons.arrow_drop_down),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(height: h*0.04,),

                       Row(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text("معلومات إضافية",style: TextStyle(
                             fontWeight: FontWeight.w600,
                             backgroundColor: Color(0xff9fa8da),
                           )),
                           IconButton(
                             onPressed: (){
                                      setState(() {
                                        show=!show;
                                      });
                             },
                               icon:Icon(Icons.add_outlined,color:Colors.grey,)),
                         ],
                       ),

                       SizedBox(height: h*0.02,),

                       Visibility(
                         visible: show,
                         child: SizedBox(
                           height: h*0.5,
                           width: double.infinity,
                           child: Card(
                             elevation: 3,
                             child: Padding(
                               padding:  EdgeInsets.only(top: h*0.01,bottom: h*0.01,left: w*0.02,right: w*0.02),
                               child: Column(
                                 children: [
                                   TextFormField(
                                     keyboardType: TextInputType.number,
                                     decoration: InputDecoration(
                                         labelText: 'علامة الحضور' ,
                                         labelStyle: TextStyle(
                                           color: Colors.grey,
                                         ),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             )
                                         )
                                     ),
                                   ),
                                   SizedBox(height: h*0.02,),
                                   TextFormField(
                                     keyboardType: TextInputType.number,
                                     decoration: InputDecoration(
                                         labelText: 'علامة المقابلة' ,
                                         labelStyle: TextStyle(
                                           color: Colors.grey,
                                         ),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             )
                                         )
                                     ),
                                   ),
                                   SizedBox(height: h*0.02,),
                                   TextFormField(
                                     keyboardType: TextInputType.number,
                                     decoration: InputDecoration(
                                         labelText: 'علامة المخبر' ,
                                         labelStyle: TextStyle(
                                           color: Colors.grey,
                                         ),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             )
                                         )
                                     ),
                                   ),
                                   SizedBox(height: h*0.02,),
                                   TextFormField(
                                     keyboardType: TextInputType.number,
                                     decoration: InputDecoration(
                                         labelText: 'علامة المذاكرة' ,
                                         labelStyle: TextStyle(
                                           color: Colors.grey,
                                         ),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             )
                                         )
                                     ),
                                   ),
                                   SizedBox(height: h*0.02,),
                                   TextFormField(
                                     keyboardType: TextInputType.number,
                                     decoration: InputDecoration(
                                         labelText: 'علامة الوظيفة' ,
                                         labelStyle: TextStyle(
                                           color: Colors.grey,
                                         ),
                                         enabledBorder: UnderlineInputBorder(
                                             borderSide: BorderSide(
                                               color: Colors.grey,
                                             )
                                         )
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),


                       SizedBox(height: h*0.02,),

                     ],
                   ),
               ),
               
             ],
           ),
         ),
          )),
    );
  }
}


// class MyCustomForm extends StatefulWidget {
//   @override
//   _MyCustomFormState createState() => _MyCustomFormState();
// }
//
// class _MyCustomFormState extends State<MyCustomForm> {
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;
//   DateTime? _selectedDate;
//   String? _selectedGender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: ListView(
//           children: <Widget>[
//         TextFormField(
//         decoration: InputDecoration(
//           labelText: 'First Name',
//           icon: Icon(Icons.person),
//         ),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter your first name';
//           }
//           return null;
//         },
//       ),
//       TextFormField(
//         decoration: InputDecoration(
//           labelText: 'Last Name',
//           icon: Icon(Icons.person),
//         ),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter your last name';
//           }
//           return null;
//         },
//       ),
//       TextFormField(
//         obscureText: !_isPasswordVisible,
//         decoration: InputDecoration(
//           labelText: 'Password',
//           icon: IconButton(
//             icon: Icon(
//               _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//             ),
//             onPressed: () {
//               setState(() {
//                 _isPasswordVisible = !_isPasswordVisible;
//               });
//             },
//           ),
//         ),
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'Please enter your password';
//           }
//           return null;
//         },
//       ),
//       TextFormField(
//         readOnly: true,
//         decoration: InputDecoration(
//           labelText: 'Birth Date',
//           icon: Icon(Icons.calendar_today),
//         ),
//         // onTap: () async {
//         //   DateTime pickedDate = await showDatePicker(
//         //     context: context,
//         //     initialDate: DateTime.now(),
//         //     firstDate: DateTime(1900),
//         //     lastDate: DateTime(2100),
//         //   );
//         //   if (pickedDate != null && pickedDate != _selectedDate)
//         //     setState(() {
//         //       _selectedDate = pickedDate;
//         //     });
//         // },
//         validator: (value) {
//           if (_selectedDate == null) {
//             return 'Please select your birth date';
//           }
//           return null;
//         },
//       ),
//       DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//       labelText: 'Gender',
//       icon: Icon(Icons.arrow_drop_down),
//     ),
//     value: _selectedGender,
//     items: ['Male', 'Female', 'Other']
//         .map((label) => DropdownMenuItem<String>(
//              child: Text(label),
//               value: label,
//                 )).toList(), onChanged: (String? value) {  },),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             if (_formKey.currentState!.validate()) {
//               // Process data.
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Processing Data')),
//               );
//             }
//           },
//           child: Text('Submit'),
//         ),
//       // onChanged: (String? value) {  },
//       // )
//     ],
//       ),
//     ),
//     );
//   }
// }

