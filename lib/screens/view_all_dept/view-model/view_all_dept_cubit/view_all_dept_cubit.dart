import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/screens/view_all_dept/model/all_dept_model.dart';
import 'package:untitled1/screens/view_all_dept/view-model/view_all_dept_cubit/view_all_dept_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/navigation/navigation.dart';
import '../../../../core/services/local/shared_preferences/shared_key.dart';
import '../../../../core/services/local/shared_preferences/shared_preferences.dart';
import '../../../../core/services/network/dio_helper/dio_helper.dart';
import '../../../../core/services/network/dio_helper/end_points.dart';

class ViewAllDeptCubit extends Cubit<ViewAllDeptState> {
  ViewAllDeptCubit() : super(ViewAllDeptInitial());

  static ViewAllDeptCubit get(context) =>
      BlocProvider.of<ViewAllDeptCubit>(context);

  var nameController = TextEditingController();
  var managerController = TextEditingController();

  AllDeptModel? allDeptModel;

  getAllDept() async {
    emit(GetAllDeptLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.getAllDept,
      token: "${SharedPreference.get(SharedKeys.token)}",
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          allDeptModel = AllDeptModel.fromJson(value.data);
          emit(GetAllDeptSuccessState());
        } else {
          emit(GetAllDeptErrorState());
          throw 'Error On Login';
        }
      },
    );
  }

  void updateDept(int id,context)async{
    emit(UpdateDeptLoadingState());
    await DioHelper.post(
      endPoint: "${EndPoints.updateDept}/$id",
      token: "${SharedPreference.get(SharedKeys.token)}",
      data: {
        "name":nameController.text,
      },
    ).then(
          (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          print("Success");
          getAllDept();
          Navigation.goPop(context);
          emit(UpdateDeptSuccessState());
        } else {
          print("fail");
          emit(UpdateDeptErrorState());
          throw 'Error On Login';
        }
      },
    );
  }

  void deleteDept(int id,context)async{
    emit(DeleteDeptLoadingState());
    await DioHelper.delete(
      endPoint: "${EndPoints.deleteDept}/$id",
      token: "${SharedPreference.get(SharedKeys.token)}",
    ).then(
          (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          print("Success");
          getAllDept();
          Navigation.goPop(context);
          emit(DeleteDeptSuccessState());
        } else {
          print("fail");
          emit(DeleteDeptErrorState());
          throw 'Error On Login';
        }
      },
    );
  }


  initController(index) {
    nameController.text = allDeptModel?.data?[index].name ?? "name";
    managerController.text = allDeptModel?.data?[index].manager?.name ?? "";
  }
}
