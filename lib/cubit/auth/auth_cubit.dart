import 'dart:io';

import 'package:auth/app/app_utils.dart';
import 'package:auth/cubit/auth/auth_state.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/models/confirm_password/confirm_password.dart';
import 'package:auth/models/forget_password/forget_password.dart';
import 'package:auth/models/login/login_request.dart';
import 'package:auth/models/login/login_response.dart';
import 'package:auth/models/register/register_request.dart';
import 'package:auth/models/register/update_profile_request.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  ApiService apiService = ApiService();
  AppStorage appStorage = AppStorage();

  void login({required email, required password}) async {
    try {
      LoginRequest model = LoginRequest(email: email, password: password);
      emit(AuthLoadingState());
      Response? response = await apiService.post(
          EndPoint.login, FormData.fromMap(model.toMap()));
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          UserResponse user = UserResponse.fromJson(json);
          appStorage.putUser(user);
          UserResponse userSaved = await appStorage.getUser();
          emit(AuthSuccessState());
          // print("start user email ${userSaved.data?.email} ");
        }
      }

      print("start post call cubit not init");
    } catch (e) {}

    // emit(AuthInitState());
  }

  void register(
      {required name,
      required email,
      required phone,
      required password}) async {
    RegisterRequest model = RegisterRequest(
        name: name, email: email, phone: phone, password: password);
    emit(AuthInitState());
    Response? response = await apiService.post(
        EndPoint.register, FormData.fromMap(model.toMap()));
    if (response != null) {
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> json = response.data as Map<String, dynamic>;
        UserResponse user = UserResponse.fromJson(json);
        //save user in cache
        appStorage.putUser(user);

        emit(AuthSuccessState());
      }
    }
    // emit(AuthInitState());
  }

  void updateProfile(
      {required name, required email, required phone, File? image}) async {
    UpdateProfileRequest model =
        UpdateProfileRequest(name: name, email: email, phone: phone);
    Map<String, dynamic> modelMap = model.toMap();
    FormData formData = FormData.fromMap(modelMap);
    if (image != null) {
      // AppUtils.addImage(modelMap, "image", image)
      //     .then((onValue) => {modelMap = onValue});
      String fileName = image.path.split('/').last;
      formData.files.add(MapEntry(
        "image",
        await MultipartFile.fromFile(
          image.path,
          filename: fileName,
        ),
      ));
    }
    emit(AuthLoadingState());
    try {
      Response? response =
          await apiService.post(EndPoint.updateProfile, formData);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("user:$json");
          UserResponse user = UserResponse.fromJson(json);
          appStorage.putUser(user);

          //save user in cache
          emit(AuthSuccessState(data: user));
        }
      }
    } catch (e) {}
    // emit(AuthInitState());
  }

  void forgetPassword({required email}) async {
    ForgetPasswordRequest model = ForgetPasswordRequest(email: email);

    emit(AuthInitState());
    Response? response = await apiService.post(
        EndPoint.forgetPassword, FormData.fromMap(model.toMap()));
    if (response != null) {
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> json = response.data as Map<String, dynamic>;
        UserResponse user = UserResponse.fromJson(json);
        //save user in cache
        emit(AuthSuccessState());
      }
    }
    emit(AuthInitState());
  }

  void confirmPassword(email, code) async {
    emit(AuthLoadingState());
    ConfirmPasswordRequest model =
        ConfirmPasswordRequest(email: email, code: code);

    Response? response = await apiService.post(
        EndPoint.forgetPassword, FormData.fromMap(model.toMap()));
    if (response != null) {
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> json = response.data as Map<String, dynamic>;
        UserResponse user = UserResponse.fromJson(json);
        emit(AuthSuccessState());
        //save user in cache
      }
    }
    emit(AuthInitState());
  }
}
