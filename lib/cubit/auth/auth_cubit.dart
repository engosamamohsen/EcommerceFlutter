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
    LoginModel model = LoginModel(email: email.text, password: password);
    emit(AuthLoadingState());
    Response? response = await apiService.post(EndPoint.login, model.toMap());
    if (response != null) {
      jsonDecode(response.data);
      if (response.statusCode == 200) {
        emit(AuthSuccessState());
      } else {
        emit(AuthSuccessState());
      }
    }
    emit(AuthInitState());
  }
}
