import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/colors/colorAssets.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

import '../../../core/services/local/flutter_secure_storage/flutter_storage.dart';
import '../../../core/services/local/flutter_secure_storage/storage_key.dart';
import '../view-model/create_dept_cubit/creat_dept_cubit.dart';
import '../view-model/create_dept_cubit/creat_dept_state.dart';

class CreateNewDepartScreen extends StatelessWidget {
  const CreateNewDepartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateDeptCubit, CreateDeptState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CreateDeptCubit.get(context);
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
                      text: "New Department!",
                      fontSize: 34.sp,
                      color: ColorAssets.darkBlue,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customText(
                      text:
                          "Create a new department now and assign a manager to start the work!",
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
                    // customTextField(
                    //   controller: cubit.managerController,
                    //   label: "Assigned Manager",
                    //   keyboardType: TextInputType.name,
                    // ),
                    // SizedBox(
                    //   height: 20.h,
                    // ),
                    customButton(
                      onPressed: () {
                        // print(cubit.nameController.text);
                        cubit.createDept();
                        // print(
                        //     "${SecureStorage.getSecureData(StorageKey.token.toString())}");
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
