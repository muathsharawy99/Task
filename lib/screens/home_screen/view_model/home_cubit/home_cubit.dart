import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/core/navigation/navigation.dart';
import 'package:untitled1/core/services/local/flutter_secure_storage/flutter_storage.dart';
import 'package:untitled1/core/services/local/flutter_secure_storage/storage_key.dart';
import 'package:untitled1/core/services/local/shared_preferences/shared_key.dart';
import 'package:untitled1/core/services/local/shared_preferences/shared_preferences.dart';
import 'package:untitled1/core/services/network/dio_helper/dio_helper.dart';
import 'package:untitled1/core/services/network/dio_helper/end_points.dart';
import 'package:untitled1/screens/home_screen/view_model/home_cubit/home_state.dart';
import 'package:untitled1/screens/login_screen/view/screens/login_screen.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  logout(context) async {
    emit(LogoutLoadingState());
    await DioHelper.post(
      endPoint: EndPoints.logout,
      token: "${SharedPreference.get(SharedKeys.token)}",
    ).then(
      (value) {
        if (value.data['code'] == 200 || value.data['code'] == 201) {
          // SecureStorage.delAllSecureData();
          print("Success");
          Navigation.goPushAndReplacement(
            context,
            LoginScreen(),
          );
          SharedPreference.clear();
          emit(LogoutSuccessState());
        } else {
          print("fail");
          emit(LogoutErrorState());
          throw 'Error On Login';
        }
      },
    );
  }

  int currentIndex = 0;

  setIndex1() {
    currentIndex = 1;
    emit(SetCurrentIndexState());
  }

  setIndex0() {
    currentIndex = 0;
    emit(SetCurrentIndexState());
  }
}
