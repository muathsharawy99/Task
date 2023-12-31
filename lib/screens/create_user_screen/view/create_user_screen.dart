import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/screens/create_user_screen/view-model/create_user_cubit/create_user_cubit.dart';

import '../../../core/colors/colorAssets.dart';
import '../../login_screen/view/components/login_components.dart';
import '../view-model/create_user_cubit/create_user_state.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CreateUserCubit.get(context);
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
                      controller: cubit.nameController,
                      label: "name",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.emailController,
                      label: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.phoneController,
                      label: "Phone",
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.passwordController,
                      label: "Password",
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true
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
                        cubit.createUser(context);
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
      },
    );
  }
}
