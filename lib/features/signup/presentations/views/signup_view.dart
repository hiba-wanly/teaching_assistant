import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/custom_button_auth.dart';
import 'package:teachers_marks/core/widgets/custom_textform_auth.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';
import 'package:teachers_marks/features/signup/presentations/manager/signup_cubit/signup_cubit.dart';
import 'package:teachers_marks/features/signup/presentations/manager/signup_cubit/signup_state.dart';
class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  double h =1;
  bool ispassword = true;
  double w=1 ;
  var formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "انشاء حساب",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Form(
          key: formkey,
          child: Container(
            padding:
            // const EdgeInsets.symmetric(
                EdgeInsets
                .only(
                top: MediaQuery.of(context).size.height * 0.02,
                bottom: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.width * 0.05,
                right: MediaQuery.of(context).size.width * 0.05),

                // horizontal: 30,vertical: 20),
            child: Center(
              child: ListView(
                children:  [
                  SizedBox(height: h*0.05,),
                    CustomTextFormAuth(
                    hintText:"أدخل اسمك الثلاثي" ,
                    labeltext:"الاسم الثلاثي",
                    iconData: Icons.person,
                    mycontroller: nameController,
                      textInputType: TextInputType.text,
                      pass: false,
                      ispassword: ispassword,
                  ),
                    CustomTextFormAuth(
                    hintText: 'أنشئ بريدك الالكتروني',
                    labeltext: 'البريد الالكتروني',
                    iconData: Icons.email_outlined,
                    mycontroller: emailController,
                      textInputType: TextInputType.emailAddress,
                      pass: false,
                      ispassword: ispassword,
                  ),
                    CustomTextFormAuth(
                    hintText: "أدخل كلمة المرور",
                    labeltext: "كلمة المرور",
                    iconData: Icons.lock_outline,
                    mycontroller: passwordcontroller,
                      textInputType: TextInputType.visiblePassword,
                      pass: true,
                      ispassword: ispassword,
                  ),
              BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      Get.to(HomeView());
                    }
                    if(state is SignupFailure){
                      debugPrint("kkkLoginFailure");
                      Flushbar(
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        messageSize: h * 0.02,
                        message: "لا يمكن اتمام العملية الأن",
                      ).show(context);
                      // Navigator.pop(context);
                    }
                  }, builder: (context, state) {
                if (state is SignupLoading) {
                  return Container(
                    width: double.infinity,
                    height: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.deepPurple],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          stops: [0.2, 0.8],
                          tileMode: TileMode.repeated,
                        )),

                    child: const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator()
                    ),
                  );
                }
                else {
                  return CustomButtonAuth(
                      text: 'متابعة',
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          BlocProvider.of<SignupCubit>(context).fetchSignupData(
                              {
                                'name':nameController.text,
                                'email':emailController.text,
                                'password':passwordcontroller.text
                              });
                        }
                      },

                  );
                }
              }
              ),

                  // SizedBox(height: 18,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}