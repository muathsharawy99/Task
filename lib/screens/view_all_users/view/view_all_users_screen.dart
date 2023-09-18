import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/screens/view_all_users/view-model/view_all_users_cubit/view_all_users_cubit.dart';

import '../../../core/navigation/navigation.dart';
import '../../login_screen/view/components/login_components.dart';
import '../../update_user_screen/view/update_user_screen.dart';
import '../view-model/view_all_users_cubit/view_all_users_state.dart';

class ViewAllUsersScreen extends StatelessWidget {
  const ViewAllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ViewAllUsersCubit, ViewAllUsersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ViewAllUsersCubit.get(context);
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
                            UpdateUserScreen(
                              index: index,
                              id: cubit.allUsersModel?.data?[index].id ?? 0,
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
                            text: "${cubit.allUsersModel?.data?[index].name}" ??
                                "user",
                            fontSize: 30.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 15.h,
                      ),
                      itemCount: cubit.allUsersModel?.data?.length ?? 3,
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
