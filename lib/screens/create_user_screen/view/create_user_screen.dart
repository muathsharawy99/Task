import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/colors/colorAssets.dart';
import '../../login_screen/view/components/login_components.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 24.w,
            end: 24.w,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 48.h,
                  width: double.infinity,
                ),
                customText(
                  text: "Add New User!",
                  fontSize: 34.sp,
                  color: ColorAssets.darkBlue,
                ),
                SizedBox(
                  height: 20.h,
                ),
                customText(
                  text:
                      "Create a new user now and assign them tasks right away.",
                  fontSize: 16.sp,
                  color: ColorAssets.greyText,
                ),
                SizedBox(
                  height: 20.h,
                ),
                customTextField(
                  ///TODO : Controller
                  controller: TextEditingController(),
                  label: "name",
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 20.h,
                ),
                customTextField(
                  ///TODO : Controller
                  controller: TextEditingController(),
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20.h,
                ),
                customTextField(
                  ///TODO : Controller
                  controller: TextEditingController(),
                  label: "Phone",
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(
                  height: 20.h,
                ),
                customTextField(
                  ///TODO : Controller
                  controller: TextEditingController(),
                  label: "Password",
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 20.h,
                ),

                ///TODO : Row
                SizedBox(
                  height: 20.h,
                ),
                customButton(
                  onPressed: () {
                    ///TODO : onPressed
                  },
                  text: "CREATE",
                  fontSize: 14.sp,
                  width: 312.w,
                  height: 48.h,
                  radius: 4.r,
                  textColor: Colors.white,
                  bGColor: ColorAssets.primaryButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
