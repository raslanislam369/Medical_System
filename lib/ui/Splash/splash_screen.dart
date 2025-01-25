import 'package:flutter/material.dart';
import 'package:intelligent_medical_system/ui/Register/login_screen.dart';
import 'package:intelligent_medical_system/ui/Register/signup_screen.dart';
import 'package:intelligent_medical_system/ui/custom/custom_btn.dart';

import '../colors/app_colors.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "Splash Screen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Intelligent",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: AppColor.secondColor),
            ),
            Text(
              "medical system",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                  color: AppColor.whiteColor),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/images/logo.png",
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: CustomBtn(
                  doThis: goToLogin,
                  textSize: 31,
                  textWeight: FontWeight.w500,
                  btnText: "Login",
                  btnTextColor: AppColor.whiteColor,
                  btnWidth: 370,
                  btnColor: AppColor.secondColor,
                  btnBorderWidth: 0,
                  btnBorderColor: Colors.transparent),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: CustomBtn(
                  doThis: goToSignUp,
                  textSize: 31,
                  textWeight: FontWeight.w500,
                  btnText: "Sign UP",
                  btnTextColor: AppColor.darkColor,
                  btnWidth: 370,
                  btnColor: AppColor.whiteColor,
                  btnBorderWidth: 3,
                  btnBorderColor: AppColor.secondColor),
            ),
          ],
        ),
      ),
    );
  }

  void goToLogin() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void goToSignUp() {
    Navigator.pushNamed(context, SignupScreen.routeName);
  }
}
