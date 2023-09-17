import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/colors/colorAssets.dart';
import 'package:untitled1/screens/login_screen/view-model/login_cubit/login_cubit.dart';
import 'package:untitled1/screens/login_screen/view-model/login_cubit/login_state.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 48.h,
                    ),
                    customText(
                      text: "Welcome Back!",
                      fontSize: 34.sp,
                      color: ColorAssets.darkBlue,
                    ),
                    SizedBox(
                      height: 20.h,
                      width: double.infinity,
                    ),
                    customText(
                      text:
                          "Login to access your assigned tasks and personal overview.",
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                      color: ColorAssets.greyText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                        controller: cubit.emailController,
                        keyboardType: TextInputType.emailAddress,
                        label: "Email",
                        fillColor: Colors.white),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                        controller: cubit.passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        label: "Password",
                        fillColor: Colors.white),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (v) {},
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        customText(
                          text: "Keep me logged in",
                          fontSize: 16.sp,
                          color: ColorAssets.darkBlue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customButton(
                      onPressed: () {
                        cubit.emailController.text ="admin@admin.com";
                        cubit.passwordController.text ="password";
                        cubit.login(context);
                      },
                      width: 312.w,
                      height: 48.h,
                      radius: 4.r,
                      bGColor: ColorAssets.primaryButton,
                      text: "LOGIN",
                      fontSize: 14.sp,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
