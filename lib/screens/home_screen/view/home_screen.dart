import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/colors/colorAssets.dart';
import 'package:untitled1/core/navigation/navigation.dart';
import 'package:untitled1/screens/home_screen/view_model/home_cubit/home_cubit.dart';
import 'package:untitled1/screens/home_screen/view_model/home_cubit/home_state.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';

import '../../../components/dept_grid/dept_grid.dart';
import '../../create_dept_screen/view/create_dept_screen.dart';
import '../../create_user_screen/view/create_user_screen.dart';
import '../../view_all_dept/view/view_all_dept_screen.dart';
import '../../view_all_employees/view/view_all_employees_screen.dart';
import '../../view_all_users/view/view_all_users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          key: cubit.drawerKey,
          appBar: AppBar(
            leadingWidth: 150.w,
            leading: Row(
              children: [
                IconButton(
                  onPressed: () {
                    cubit.drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                      text: "Today",
                      fontSize: 16.sp,
                      color: ColorAssets.darkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                    customText(
                      text:
                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                      fontSize: 12.sp,
                      color: ColorAssets.greyText,
                    ),
                  ],
                )
              ],
            ),
            actions: [
              PopupMenuButton(
                icon: Icon(
                  Icons.add_box_rounded,
                  color: ColorAssets.primaryButton,
                  size: 35.sp,
                ),
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      child: customText(
                        text: "employee",
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                    PopupMenuItem(
                      child: customText(
                        text: "department",
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                    PopupMenuItem(
                      child: customText(
                        text: "task",
                        fontSize: 10.sp,
                        color: Colors.black,
                      ),
                    ),
                  ];
                },
              )
            ],
          ),
          drawer: NavigationDrawer(
            // backgroundColor: Colors.grey,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Muath Sharawy",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "muath0sharawy@gmail.com",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      color: ColorAssets.greyText,
                      width: 2.w,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigation.goPush(
                      context,
                      CreateNewDepartScreen(),
                    );
                  },
                  leading: Icon(
                    Icons.add_box_outlined,
                    color: ColorAssets.darkBlue,
                  ),
                  title: Text(
                    "Add New Dept",
                    style: TextStyle(
                      color: ColorAssets.darkBlue,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      color: ColorAssets.greyText,
                      width: 2.w,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigation.goPush(
                      context,
                      ViewAllDeptScreen(),
                    );
                  },
                  leading: Icon(
                    Icons.category_outlined,
                    color: ColorAssets.darkBlue,
                  ),
                  title: Text(
                    "View Departments",
                    style: TextStyle(
                      color: ColorAssets.darkBlue,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      color: ColorAssets.greyText,
                      width: 2.w,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigation.goPush(
                      context,
                      CreateUserScreen(),
                    );
                  },
                  leading: Icon(
                    Icons.person_add_alt_outlined,
                    color: ColorAssets.darkBlue,
                  ),
                  title: Text(
                    "Add New User",
                    style: TextStyle(
                      color: ColorAssets.darkBlue,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      color: ColorAssets.greyText,
                      width: 2.w,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigation.goPush(
                      context,
                      ViewAllUsersScreen(),
                    );
                  },
                  leading: Icon(
                    Icons.person_search_outlined,
                    color: ColorAssets.darkBlue,
                  ),
                  title: Text(
                    "Update Users",
                    style: TextStyle(
                      color: ColorAssets.darkBlue,
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      color: ColorAssets.greyText,
                      width: 2.w,
                      strokeAlign: BorderSide.strokeAlignInside,
                    ),
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    Navigation.goPush(
                      context,
                      ViewAllEmployeesScreen(),
                    );
                  },
                  leading: Icon(
                    Icons.add_alarm_rounded,
                    color: ColorAssets.darkBlue,
                  ),
                  title: Text(
                    "Add Task",
                    style: TextStyle(
                      color: ColorAssets.darkBlue,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 160.h,
              ),
              ListTile(
                tileColor: Colors.red,
                onTap: () {
                  cubit.logout(context);
                },
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: 24.w,
              end: 24.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          cubit.setIndex0();
                        },
                        child: Container(
                          width: 85.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                              bottom: BorderSide(
                                color: cubit.currentIndex == 0
                                    ? ColorAssets.primaryButton
                                    : ColorAssets.darkBlue,
                                width: 5,
                              ),
                            ),
                          ),
                          padding: EdgeInsetsDirectional.all(
                            5.w,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.perm_identity_outlined,
                                color: cubit.currentIndex == 0
                                    ? ColorAssets.primaryButton
                                    : ColorAssets.darkBlue,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              customText(
                                text: "USERS",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: cubit.currentIndex == 0
                                    ? ColorAssets.primaryButton
                                    : ColorAssets.darkBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        onTap: () {
                          cubit.setIndex1();
                        },
                        child: Container(
                          width: 85.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            border: BorderDirectional(
                              bottom: BorderSide(
                                color: cubit.currentIndex == 1
                                    ? ColorAssets.primaryButton
                                    : ColorAssets.darkBlue,
                                width: 5,
                              ),
                            ),
                          ),
                          padding: EdgeInsetsDirectional.all(
                            5.w,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.newspaper_rounded,
                                color: cubit.currentIndex == 1
                                    ? ColorAssets.primaryButton
                                    : ColorAssets.darkBlue,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              customText(
                                text: "TASKS",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: cubit.currentIndex == 1
                                    ? ColorAssets.primaryButton
                                    : ColorAssets.darkBlue,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    child: deptGrid(),
                    replacement: Text("NO Data"),
                    visible: cubit.currentIndex == 0 ? true : false,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
