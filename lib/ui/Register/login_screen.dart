import 'package:flutter/material.dart';
import 'package:intelligent_medical_system/ui/Register/signup_screen.dart';
import 'package:intelligent_medical_system/ui/custom/custom_btn.dart';
import 'package:intelligent_medical_system/ui/custom/custom_textfield.dart';

import '../colors/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "Login Screen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColor.whiteColor),
          toolbarHeight: 28,
          backgroundColor: AppColor.primaryColor,
        ),
        backgroundColor: AppColor.primaryColor,
        body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back,",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 27,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    " Log in to get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.whiteColor,
                        fontSize: 27,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 200,
                    height: 180,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    Hint: "Username,email or mobile number",
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextfield(
                    Hint: "Password",
                    sufIcon: Icon(Icons.visibility_off_outlined),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomBtn(
                      doThis: () {},
                      btnText: "Log in",
                      btnTextColor: AppColor.whiteColor,
                      textSize: 25,
                      textWeight: FontWeight.w700,
                      btnWidth: 250,
                      btnColor: AppColor.secondColor,
                      btnBorderWidth: 0,
                      btnBorderColor: Colors.transparent),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  CustomBtn(
                      doThis: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                      btnText: "Create new account",
                      btnTextColor: AppColor.whiteColor,
                      textSize: 15,
                      textWeight: FontWeight.normal,
                      btnWidth: double.infinity,
                      btnColor: Colors.transparent,
                      btnBorderWidth: 2,
                      btnBorderColor: AppColor.secondColor)
                ])));
  }
}
