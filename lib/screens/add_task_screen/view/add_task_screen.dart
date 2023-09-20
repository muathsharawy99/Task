import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled1/core/colors/colorAssets.dart';
import 'package:untitled1/screens/add_task_screen/view-model/add_task_cubit.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

import '../view-model/add_task_state.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AddTaskCubit.get(context);
        return Scaffold(
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
                    ),
                    customText(
                      text: "Add New Task!",
                      fontSize: 34.sp,
                      color: ColorAssets.darkBlue,
                    ),
                    SizedBox(
                      height: 20.h,
                      width: double.infinity,
                    ),
                    customText(
                      text:
                          "Create a new task now and assign it to employees right away.",
                      fontSize: 16.sp,
                      textAlign: TextAlign.center,
                      color: ColorAssets.greyText,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SfDateRangePicker(
                      view: DateRangePickerView.month,
                      monthViewSettings: const DateRangePickerMonthViewSettings(
                        firstDayOfWeek: 6,
                      ),
                      controller: cubit.dateController,
                      selectionMode: DateRangePickerSelectionMode.range,
                      showActionButtons: false,
                      onSelectionChanged: (v) {
                        print(
                            "${cubit.dateController.selectedRange?.startDate?.year}-${cubit.dateController.selectedRange?.startDate?.month}-${cubit.dateController.selectedRange?.startDate?.day}");
                        print(
                            "${cubit.dateController.selectedRange?.endDate?.year}-${cubit.dateController.selectedRange?.endDate?.month}-${cubit.dateController.selectedRange?.endDate?.day}");
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.titleController,
                      label: "Title",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.desController,
                      label: "Description",
                      maxLines: 3,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.employeeController,
                      label: "Assigned Employee",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customTextField(
                      controller: cubit.deptController,
                      label: "Assigned Department",
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    customButton(
                      onPressed: () {
                        cubit.addTask(id, context);
                      },
                      text: "CREATE",
                      fontSize: 14.sp,
                      width: 312.w,
                      height: 48.h,
                      textColor: Colors.white,
                      bGColor: ColorAssets.primaryButton,
                      radius: 4.r,
                    ),
                    SizedBox(
                      height: 20.h,
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
