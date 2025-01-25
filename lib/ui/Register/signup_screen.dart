import 'package:flutter/material.dart';
import 'package:intelligent_medical_system/ui/Register/login_screen.dart';
import 'package:intelligent_medical_system/ui/custom/custom_btn.dart';
import 'package:intelligent_medical_system/ui/custom/custom_textfield.dart';

import '../colors/app_colors.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = "SignUp Screen";

  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        toolbarHeight: 30,
        backgroundColor: AppColor.primaryColor,
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          children: [
            Text(
              'New To Us !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 27,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 70,
            ),
            CustomTextfield(Hint: "Enter Your Name"),
            SizedBox(
              height: 15,
            ),
            CustomTextfield(
              Hint: "Enter Your Email",
              sufIcon: Icon(color: Colors.grey, Icons.email_outlined),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextfield(
              Hint: "Comfirm Your Email ",
              sufIcon: Icon(color: Colors.grey, Icons.email_outlined),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextfield(
              Hint: "Enter Your Password",
              sufIcon: Icon(color: Colors.grey, Icons.visibility_outlined),
            ),
            SizedBox(
              height: 15,
            ),
            CustomTextfield(
              Hint: "Comfirm Password",
              sufIcon: Icon(color: Colors.grey, Icons.visibility_off_outlined),
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(fontSize: 15, color: AppColor.whiteColor)),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text(
                    " Log in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.pink),
                  ),
                )
              ],
            ),
            CustomBtn(
                doThis: () {},
                btnText: "Sign Up",
                btnTextColor: AppColor.whiteColor,
                textSize: 15,
                textWeight: FontWeight.normal,
                btnWidth: 250,
                btnColor: Colors.transparent,
                btnBorderWidth: 2,
                btnBorderColor: AppColor.secondColor)
          ],
        ),
      ),
    );
  }
}
