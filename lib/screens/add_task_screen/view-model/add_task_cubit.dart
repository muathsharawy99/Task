import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:untitled1/screens/add_task_screen/view-model/add_task_state.dart';

import '../../../core/navigation/navigation.dart';
import '../../../core/services/local/shared_preferences/shared_key.dart';
import '../../../core/services/local/shared_preferences/shared_preferences.dart';
import '../../../core/services/network/dio_helper/dio_helper.dart';
import '../../../core/services/network/dio_helper/end_points.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  static AddTaskCubit get(context) => BlocProvider.of<AddTaskCubit>(context);
  var titleController = TextEditingController();
  var desController = TextEditingController();
  var employeeController = TextEditingController();
  var deptController = TextEditingController();
  var dateController = DateRangePickerController();

  addTask(int id,context) async {
    emit(AddTaskLoadingState());
    await DioHelper.post(
      endPoint: EndPoints.addTask,
      token: "${SharedPreference.get(SharedKeys.token)}",
      data: {
        "name": titleController.text,
        "description": desController.text,
        "status": 0,
        "start_date":
            "${dateController.selectedRange?.startDate?.year}-${dateController.selectedRange?.startDate?.month}-${dateController.selectedRange?.startDate?.day}",
        "end_date":
            "${dateController.selectedRange?.endDate?.year}-${dateController.selectedRange?.endDate?.month}-${dateController.selectedRange?.endDate?.day}",
        "employee_id": id,
      },
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          print("Success");
          Navigation.goPop(context);
          emit(AddTaskSuccessState());
        } else {
          print("fail");
          emit(AddTaskErrorState());
          throw 'Error On Login';
        }
      },
    );
  }
}
