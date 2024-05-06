import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/custom_button_auth.dart';
import 'package:teachers_marks/core/widgets/custom_textform_auth.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  double h =1;
  double w=1 ;


  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "تسجيل دخول",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          padding:  EdgeInsets
              .only(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05),
          //     .symmetric(
          //
          //     horizontal: 30
          // ),
          child: Center(
            child: ListView(
              children:  [
                SizedBox(height:h*0.05),
                const  CustomTextFormAuth(
                  hintText: 'أدخل بريدك الالكتروني',
                  labeltext: 'البريد الالكتروني',
                  iconData: Icons.email_outlined,
                  // mycontroller: null,
                ),

                const  CustomTextFormAuth(
                  hintText: "أدخل كلمة المرور",
                  labeltext: "كلمة المرور",
                  iconData: Icons.lock_outline,
                  // mycontroller: null,
                ),
                CustomButtonAuth(text: 'تسجيل دخول',onPressed: (){Get.to(HomeView());},),
              ],
            ),
          ),
        ),
      ),
    ); }
}
