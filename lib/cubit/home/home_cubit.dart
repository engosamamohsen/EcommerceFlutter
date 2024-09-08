import 'dart:convert';

import 'package:auth/cubit/auth/auth_state.dart';
import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/models/confirm_password/confirm_password.dart';
import 'package:auth/models/forget_password/forget_password.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/models/login/login_request.dart';
import 'package:auth/models/login/login_response.dart';
import 'package:auth/models/register/register_request.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  ApiService apiService = ApiService();
  AppStorage appStorage = AppStorage();

  void home() async {
    emit(HomeLoadingState());
    Response? response = await apiService.get(EndPoint.home);
    print("start post call cubit");

    if (response != null) {
      print("start post call cubit not null");
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        print("start post call cubit not null dynamic");
        final Map<String, dynamic> json = response.data as Map<String, dynamic>;
        HomeResponse homeResponse = HomeResponse.fromJson(json);
        emit(HomeSuccessState<HomeResponse>(data: homeResponse));
        // print(homeResponse.data.categories[0].name);
        print("welcome in home");
        // emit(HomeInitState());
        print("welcome in home part 2");
        // print("start user email ${userSaved.data?.email} ");
      }
    }

    print("start post call cubit not init");
    // emit(HomeSuccessState());
  }
}