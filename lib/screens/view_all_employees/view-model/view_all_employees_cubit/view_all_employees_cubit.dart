import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/view_all_employees/view-model/view_all_employees_cubit/view_all_employees_state.dart';
import 'package:untitled1/screens/view_all_users/model/all_users_model.dart';
import 'package:untitled1/screens/view_all_users/view-model/view_all_users_cubit/view_all_users_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/services/local/shared_preferences/shared_key.dart';
import '../../../../core/services/local/shared_preferences/shared_preferences.dart';
import '../../../../core/services/network/dio_helper/dio_helper.dart';
import '../../../../core/services/network/dio_helper/end_points.dart';
import '../../model/all_employees_model.dart';

class ViewAllEmployeesCubit extends Cubit<ViewAllEmployeesState> {
  ViewAllEmployeesCubit() : super(ViewAllEmployeesInitial());

  static ViewAllEmployeesCubit get(context) =>
      BlocProvider.of<ViewAllEmployeesCubit>(context);

  AllEmployeesModel? allEmployeesModel;

  getAllEmployees() async {
    emit(GetAllEmployeesLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.getAllEmployees,
      token: "${SharedPreference.get(SharedKeys.token)}",
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          allEmployeesModel = AllEmployeesModel.fromJson(value.data);
          print("success");
          emit(GetAllEmployeesSuccessState());
        } else {
          emit(GetAllEmployeesErrorState());
          throw 'Error On Login';
        }
      },
    );
  }





















}
