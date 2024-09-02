import 'dart:convert';

import 'package:auth/cubit/auth/auth_state.dart';
import 'package:auth/models/loginModel.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  ApiService apiService = ApiService();

  void login({required email, required password}) async {
    LoginModel model = LoginModel(email: email, password: password);
    print("start");
    emit(AuthLoadingState());
    print("start loading");
    Response? response = await apiService.post(EndPoint.login, model.toMap());
    print("start response");
    if (response != null) {
      print("start not null");
      // jsonDecode(response.data);
            // Map<String, dynamic> data = jsonDecode(response.data);
      // print('Decoded response data: $data');

      if (response.statusCode == 200) {
      print("start print 200");
        emit(AuthSuccessState());
      } else {
      print("start print not 200");
        emit(AuthSuccessState());
      }
    }
    print("start init state");
    emit(AuthInitState());
  }
}
