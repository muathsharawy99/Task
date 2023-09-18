import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';
import 'package:untitled1/screens/update_dept_screen/view/update_dept_screen.dart';
import 'package:untitled1/screens/view_all_dept/model/all_dept_model.dart';
import 'package:untitled1/screens/view_all_dept/view-model/view_all_dept_cubit/view_all_dept_cubit.dart';

import '../../../core/navigation/navigation.dart';
import '../view-model/view_all_dept_cubit/view_all_dept_state.dart';

class ViewAllDeptScreen extends StatelessWidget {
  const ViewAllDeptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewAllDeptCubit, ViewAllDeptState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ViewAllDeptCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 24.w,
                end: 24.w,
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 48.h,
                      width: double.infinity,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          cubit.initController(index);
                          Navigation.goPush(
                            context,
                            UpdateDeptScreen(
                              index: index,
                              id: cubit.allDeptModel?.data?[index].id ?? 0,
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.r,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 2.w,
                            ),
                          ),
                          child: customText(
                            text: "${cubit.allDeptModel?.data?[index].name}" ??
                                "name",
                            fontSize: 30.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                      itemCount: cubit.allDeptModel?.data?.length ?? 3,
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
