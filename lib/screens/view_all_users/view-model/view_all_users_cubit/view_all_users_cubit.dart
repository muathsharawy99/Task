import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/view_all_users/model/all_users_model.dart';
import 'package:untitled1/screens/view_all_users/view-model/view_all_users_cubit/view_all_users_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/services/local/shared_preferences/shared_key.dart';
import '../../../../core/services/local/shared_preferences/shared_preferences.dart';
import '../../../../core/services/network/dio_helper/dio_helper.dart';
import '../../../../core/services/network/dio_helper/end_points.dart';

class ViewAllUsersCubit extends Cubit<ViewAllUsersState> {
  ViewAllUsersCubit() : super(ViewAllUsersInitial());

  static ViewAllUsersCubit get(context) =>
      BlocProvider.of<ViewAllUsersCubit>(context);

  AllUsersModel? allUsersModel;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var typeController = TextEditingController();

  getAllUsers() async {
    emit(GetAllUsersLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.getAllUser,
      token: "${SharedPreference.get(SharedKeys.token)}",
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          allUsersModel = AllUsersModel.fromJson(value.data);
          print("success");
          emit(GetAllUsersSuccessState());
        } else {
          emit(GetAllUsersErrorState());
          throw 'Error On Login';
        }
      },
    );
  }

  void updateUser(int id, context) async {
    emit(UpdateUserLoadingState());
    await DioHelper.post(
      endPoint: "${EndPoints.updateUser}/$id",
      token: "${SharedPreference.get(SharedKeys.token)}",
      data: {
        "name": nameController.text,
        "email": emailController.text,
        "phone": int.parse(phoneController.text),
        "password": passwordController.text,
        "user_type": 1,
        "user_status": 0,
      },
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          print("Success");
          getAllUsers();
          Navigation.goPop(context);
          emit(UpdateUserSuccessState());
        } else {
          print("fail");
          emit(UpdateUserErrorState());
          throw 'Error On Login';
        }
      },
    );
  }

  initController(index) {
    nameController.text = allUsersModel?.data?[index].name ?? "";
    emailController.text = allUsersModel?.data?[index].email ?? "";
    phoneController.text = allUsersModel?.data?[index].phone.toString() ?? "";
    typeController.text = allUsersModel?.data?[index].userType ?? "";
  }





















}
