import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:teachers_marks/constants.dart';
import 'package:teachers_marks/core/widgets/button_loading.dart';
import 'package:teachers_marks/core/widgets/custom_button_auth.dart';
import 'package:teachers_marks/core/widgets/custom_textform_auth.dart';
import 'package:teachers_marks/features/home/presentations/views/home_view.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_cubit.dart';
import 'package:teachers_marks/features/login/presentations/manager/login_cubit/login_state.dart';
import 'package:teachers_marks/splash_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // bool _isHovering = false;
  double h = 1;
  bool ispassword = true;
  double w = 1;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  var formkey = GlobalKey<FormState>();

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
        body: Form(
          key: formkey,
          child: Container(
            padding: EdgeInsets.only(
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
                children: [
                  SizedBox(height: h * 0.05),
                  CustomTextFormAuth(
                    hintText: 'أدخل اسم المستخدم',
                    labeltext: 'اسم المستخدم',
                    iconData: Icons.email_outlined,
                    mycontroller: usernameController,
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
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "هل نسيت كلمة المرور؟",
                      style: TextStyle(color: Colors.blue,fontFamily: Almarai,),
                    ),
                  ),

                  BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                    if (state is LoginSuccess) {
                      Get.to(SplashScreen());
                    }
                    if (state is LoginFailure) {
                      // debugPrint("kkkLoginFailure");
                      Flushbar(
                        duration: const Duration(seconds: 3),
                        backgroundColor: Colors.white,
                        messageColor: Colors.black,
                        messageSize: h * 0.02,
                        message: state.errMessage,
                      ).show(context);
                      // Navigator.pop(context);
                    }
                  }, builder: (context, state) {
                    if (state is LoginLoading) {
                      return ButtonLoading();
                      //   Container(
                      //   width: double.infinity,
                      //   height: h * 0.06,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(5),
                      //       gradient: const LinearGradient(
                      //         colors: [kButtonColorBlue1, kButtonColorBlue2],
                      //         begin: Alignment.bottomLeft,
                      //         end: Alignment.topRight,
                      //         stops: [0.2, 0.8],
                      //         tileMode: TileMode.repeated,
                      //       )),
                      //
                      //   child: const Align(
                      //       alignment: Alignment.center,
                      //       child: CircularProgressIndicator()
                      //   ),
                      // );
                    } else {
                      return



                        CustomButtonAuth(
                        text: 'تسجيل دخول',
                        onPressed: () {



                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context)
                                .fetchLoginData({
                              'username': usernameController.text,
                              'password': passwordcontroller.text




                                });
                          }
                        },
                      );
                    }
                  }),
              // CustomButtonAuth(
              //         text: 'تسجيل دخول',
              //         onPressed: () {
              //         Get.offAll(HomeView());
              //         })


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
