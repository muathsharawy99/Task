import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/navigation/navigation.dart';
import 'package:untitled1/screens/home_screen/view_model/home_cubit/home_cubit.dart';
import 'package:untitled1/screens/home_screen/view_model/home_cubit/home_state.dart';
import 'package:untitled1/screens/login_screen/view/components/login_components.dart';
import 'package:untitled1/screens/update_dept_screen/view/update_dept_screen.dart';

import '../../create_dept_screen/view/create_dept_screen.dart';
import '../../create_user_screen/view/create_user_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "There is drawer",
            ),
            centerTitle: true,
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
              ListTile(
                tileColor: Colors.green,
                onTap: () {
                  Navigation.goPush(
                    context,
                    CreateNewDepartScreen(),
                  );
                },
                leading: Icon(
                  Icons.exposure_plus_1,
                  color: Colors.white,
                ),
                title: Text(
                  "Add New Dept",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),ListTile(
                tileColor: Colors.green,
                onTap: () {
                  Navigation.goPush(
                    context,
                    CreateUserScreen(),
                  );
                },
                leading: Icon(
                  Icons.exposure_plus_1,
                  color: Colors.white,
                ),
                title: Text(
                  "Add New User",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.yellow,
                onTap: () {
                  Navigation.goPush(
                    context,
                    UpdateDeptScreen(),
                  );
                },
                leading: Icon(
                  Icons.update,
                  color: Colors.black,
                ),
                title: Text(
                  "Update Department",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                tileColor: Colors.red,
                onTap: () {
                  ///TODO : Logout
                  cubit.logout(context);
                  // SecureStorage.delAllSecureData();
                  // Navigation.goPushAndReplacement(
                  //   context,
                  //   LoginScreen(),
                  // );
                },
                leading: Icon(
                  Icons.logout,
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
          body: Center(
            child: customText(
              text: "This is HOME SCREEN",
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
        );
      },
    );
  }
}
