import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled1/core/services/local/shared_preferences/shared_preferences.dart';
import 'package:untitled1/core/services/network/dio_helper/dio_helper.dart';
import 'package:untitled1/screens/add_task_screen/view-model/add_task_cubit.dart';
import 'package:untitled1/screens/create_dept_screen/view-model/create_dept_cubit/creat_dept_cubit.dart';
import 'package:untitled1/screens/create_user_screen/view-model/create_user_cubit/create_user_cubit.dart';
import 'package:untitled1/screens/home_screen/view_model/home_cubit/home_cubit.dart';
import 'package:untitled1/screens/login_screen/view-model/login_cubit/login_cubit.dart';
import 'package:untitled1/screens/user_home_screen/view/user_home_screen.dart';
import 'package:untitled1/screens/view_all_dept/view-model/view_all_dept_cubit/view_all_dept_cubit.dart';
import 'package:untitled1/screens/view_all_employees/view-model/view_all_employees_cubit/view_all_employees_cubit.dart';
import 'package:untitled1/screens/view_all_users/view-model/view_all_users_cubit/view_all_users_cubit.dart';

import 'screens/login_screen/view/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreference.initShared();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(),
            ),
            BlocProvider(
              create: (context) => HomeCubit(),
            ),
            BlocProvider(
              create: (context) => CreateDeptCubit(),
            ),
            BlocProvider(
              create: (context) => ViewAllDeptCubit()..getAllDept(),
            ),
            BlocProvider(
              create: (context) => CreateUserCubit(),
            ),
            BlocProvider(
              create: (context) => ViewAllUsersCubit()..getAllUsers(),
            ),
            BlocProvider(
              create: (context) => AddTaskCubit(),
            ),
            BlocProvider(
              create: (context) => ViewAllEmployeesCubit()..getAllEmployees(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              useMaterial3: true,
            ),
            home:
                // UserHomeScreen(),
                LoginScreen(),
          ),
        );
      },
    );
  }
}
