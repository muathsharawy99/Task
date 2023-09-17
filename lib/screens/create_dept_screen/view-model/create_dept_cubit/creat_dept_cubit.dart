import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/services/network/dio_helper/dio_helper.dart';
import 'package:untitled1/core/services/network/dio_helper/end_points.dart';
import '../../../../core/services/local/flutter_secure_storage/flutter_storage.dart';
import '../../../../core/services/local/flutter_secure_storage/storage_key.dart';
import '../../model/dept_model.dart';
import 'creat_dept_state.dart';

class CreateDeptCubit extends Cubit<CreateDeptState> {
  CreateDeptCubit() : super(CreateUserInitial());

  DeptModel? deptModel;

  static CreateDeptCubit get(context) =>
      BlocProvider.of<CreateDeptCubit>(context);

  var nameController = TextEditingController();
  var managerController = TextEditingController();

    createDept() {
    emit(CreateDeptLoadingState());
    DioHelper.post(
      endPoint: EndPoints.createDept,
      token: "${SecureStorage.getSecureData(StorageKey.token)}",
       data: {
        "name": "shahdshibbbbbbb",
      },
    ).then(
      (value) {
        print(value.data['code']);
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          print("Success");
          deptModel = DeptModel.fromJson(value.data);
          emit(CreateDeptSuccessState());
        } else if (value.data['code'] == 401) {
          print("Errrrrrrrrrrrrrrrrr is ${value.data['message']}");
        }

        else {
          print("fail");
          emit(CreateDeptErrorState());
          throw 'Error On Login';
        }
      },
    ).catchError((error){
      if (error is DioException && error.response?.statusCode == 401){
        final data = error.response?.data;
        final message = data['message'];
        print(message);
        print("1");
        emit(CreateDeptErrorState());
      }
    });
  }
}
