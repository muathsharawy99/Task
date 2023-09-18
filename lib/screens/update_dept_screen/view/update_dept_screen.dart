import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/screens/view_all_dept/view-model/view_all_dept_cubit/view_all_dept_cubit.dart';

import '../../../core/colors/colorAssets.dart';
import '../../login_screen/view/components/login_components.dart';
import '../../view_all_dept/view-model/view_all_dept_cubit/view_all_dept_state.dart';

class UpdateDeptScreen extends StatelessWidget {
  const UpdateDeptScreen({
    super.key,
    required this.index,
    required this.id,
  });

  final int index;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewAllDeptCubit, ViewAllDeptState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ViewAllDeptCubit.get(context);
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
                      text: "Update Department!",
                      fontSize: 34.sp,
                      textAlign: TextAlign.center,
                      color: ColorAssets.darkBlue,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customText(
                      text:
                          "Update  department details and assign a new manager to continue work!",
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
                      controller: cubit.managerController,
                      label: "Assigned Manager",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customButton(
                      onPressed: () {
                        cubit.updateDept(id, context);
                      },
                      text: "Update",
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
                    customButton(
                      onPressed: () {
                        ///TODO : Delete
                        cubit.deleteDept(id, context);
                      },
                      text: "Delete",
                      fontSize: 14.sp,
                      width: 312.w,
                      height: 48.h,
                      radius: 4.r,
                      textColor: Colors.white,
                      bGColor: Colors.red,
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
