import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/services/local/shared_preferences/shared_key.dart';
import '../../../../core/services/local/shared_preferences/shared_preferences.dart';
import '../../../../core/services/network/dio_helper/dio_helper.dart';
import '../../../../core/services/network/dio_helper/end_points.dart';
import 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserState> {
  CreateUserCubit() : super(CreateUserInitial());

  static CreateUserCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var typeController = TextEditingController();

  createUser(context) {
    emit(CreateUserLoadingState());
    DioHelper.post(
      endPoint: EndPoints.createUser,
      token: "${SharedPreference.get(SharedKeys.token)}",
      data: {
        "name": nameController.text,
        "email": emailController.text,
        "phone": int.parse(phoneController.text),
        "password": passwordController.text,
        "user_type": 1,
        // int.parse(typeController.text),
      },
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          print("Success");
          Navigation.goPop(context);
          emit(CreateUserSuccessState());
        } else {
          print("fail");
          emit(CreateUserErrorState());
          throw 'Error On Login';
        }
      },
    ).catchError((error) {
      if (error is DioException && error.response?.statusCode == 401) {
        final data = error.response?.data;
        final message = data['message'];
        print(message);
        print("1");
        emit(CreateUserErrorState());
      }
    });
  }
}
