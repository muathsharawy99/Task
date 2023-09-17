import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/navigation/navigation.dart';
import 'package:untitled1/core/services/local/flutter_secure_storage/flutter_storage.dart';
import 'package:untitled1/core/services/local/flutter_secure_storage/storage_key.dart';
import 'package:untitled1/core/services/network/dio_helper/dio_helper.dart';
import 'package:untitled1/core/services/network/dio_helper/end_points.dart';
import 'package:untitled1/screens/home_screen/view/home_screen.dart';
import 'package:untitled1/screens/login_screen/view-model/login_cubit/login_state.dart';

import '../../model/user_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserModel? userModel;

  void login(context) {
    emit(LoginLoadingState());
    DioHelper.post(
      endPoint: EndPoints.login,
      data: {
        "email": emailController.text,
        "password": passwordController.text,
      },
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          userModel = UserModel.fromJson(value.data);
          SecureStorage.setSecureData(
            "token1",
            value.data['data']['token'],
          );
          print(SecureStorage.getSecureData("token1").toString());
          print(value.data['data']['token']);
          Navigation.goPushAndReplacement(
            context,
            HomeScreen(),
          );
          // SharedPreference.set(SharedKeys.token, userModel?.token);
          emit(LoginSuccessState());
        } else {
          print("fail");
          emit(LoginErrorState());
          throw 'Error On Login';
        }
      },
    );
  }
}
