import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/screens/add_task_screen/view/add_task_screen.dart';
import 'package:untitled1/screens/view_all_dept/view-model/view_all_dept_cubit/view_all_dept_cubit.dart';

import '../../../core/colors/colorAssets.dart';
import '../../../core/navigation/navigation.dart';
import '../../login_screen/view/components/login_components.dart';
import '../../view_all_dept/view-model/view_all_dept_cubit/view_all_dept_state.dart';
import '../../view_all_users/view-model/view_all_users_cubit/view_all_users_cubit.dart';
import '../../view_all_users/view-model/view_all_users_cubit/view_all_users_state.dart';

class UpdateUserScreen extends StatelessWidget {
  const UpdateUserScreen({
    super.key,
    required this.index,
    required this.id,
  });

  final int index;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewAllUsersCubit, ViewAllUsersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ViewAllUsersCubit.get(context);
        return Scaffold(
          // resizeToAvoidBottomInset: true,
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
                        text: "Update User Details!",
                        fontSize: 34.sp,
                        color: ColorAssets.darkBlue,
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 20.h,
                    ),
                    customText(
                      text: "Update user details and give them a new identity.",
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
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
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.typeController,
                      label: "User Type",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customButton(
                      onPressed: () {
                        cubit.updateUser(
                          id,
                          context,
                        );
                      },
                      text: "Update User Data",
                      fontSize: 14.sp,
                      width: 312.w,
                      height: 48.h,
                      radius: 4.r,
                      textColor: Colors.white,
                      bGColor: ColorAssets.primaryButton,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ///TODO : ADD TASK
                    // customButton(
                    //   onPressed: () {
                    //     ///TODO : Add
                    //     Navigation.goPush(
                    //       context,
                    //       AddTaskScreen(
                    //         id: id,
                    //       ),
                    //     );
                    //   },
                    //   text: "Add Task",
                    //   fontSize: 14.sp,
                    //   width: 312.w,
                    //   height: 48.h,
                    //   radius: 4.r,
                    //   textColor: Colors.white,
                    //   bGColor: ColorAssets.darkBlue,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    customButton(
                      onPressed: () {
                        ///TODO : Delete
                        // cubit.deleteDept(id,context);
                      },
                      text: "Delete User",
                      fontSize: 14.sp,
                      width: 312.w,
                      height: 48.h,
                      radius: 4.r,
                      textColor: Colors.white,
                      bGColor: Colors.red,
                    ),
                    SizedBox(height: 20.h,),
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
