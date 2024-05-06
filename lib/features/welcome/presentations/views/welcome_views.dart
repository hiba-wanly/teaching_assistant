import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/features/login/presentations/views/login_view.dart';
import 'package:teachers_marks/features/signup/presentations/views/signup_view.dart';

import 'widgets/custom_button_welcome.dart';
import 'widgets/logo_auth.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {

  double h =1;
  double w=1 ;


  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return Directionality(
        textDirection: TextDirection.rtl,

      child:Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: h*0.04,),
           const  LogoAuth(),
              CustomButtonWelcome(
                  prefixIcon: Icons.account_circle_outlined,
                  text: "تسجيل الدخول باستخدام حسابك",
                  onPressed: () {
                    Get.to(const LoginView());
                  }),
              CustomButtonWelcome(
                prefixIcon: Icons.person_add,
                text: "انشاء حساب جديد",
                onPressed: () {
                  Get.to(const SignupView());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
