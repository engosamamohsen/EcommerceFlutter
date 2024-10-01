import 'dart:io';

import 'package:Emend/cubit/auth/auth_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/models/confirm_password/confirm_password.dart';
import 'package:Emend/models/forget_password/forget_password.dart';
import 'package:Emend/models/login/login_request.dart';
import 'package:Emend/models/login/login_response.dart';
import 'package:Emend/models/register/register_request.dart';
import 'package:Emend/models/register/update_profile_request.dart';
import 'package:Emend/network/api_service.dart';
import 'package:Emend/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitState());

  ApiService apiService = ApiService();
  AppStorageShared appStorage = AppStorageShared();

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
          appStorage.putToken(user.data?.jwtToken);
          String? token = await appStorage.readToken();
          print("token auth $token");
          UserResponse userSaved = await appStorage.getUser();
          emit(AuthSuccessState());
          // print("start user email ${userSaved.data?.email} ");
        } else
          emit(AuthTryAgainState());
      } else
        emit(AuthTryAgainState());

      print("start post call cubit not init");
    } catch (e) {
      emit(AuthFailedState(message: e.toString()));
    }
  }

  void register(
      {required name,
      required email,
      required phone,
      required password}) async {
    RegisterRequest model = RegisterRequest(
        name: name, email: email, phone: phone, password: password);
    emit(AuthLoadingState());
    Response? response = await apiService.post(
        EndPoint.register, FormData.fromMap(model.toMap()));
    if (response != null) {
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> json = response.data as Map<String, dynamic>;
        UserResponse user = UserResponse.fromJson(json);
        //save user in cache
        appStorage.putUser(user);
        UserResponse userSaved = await appStorage.getUser();

        emit(AuthSuccessState());
      } else {
        emit(AuthTryAgainState());
      }
    } else
      emit(AuthTryAgainState());
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
        } else
          emit(AuthTryAgainState());
      } else
        emit(AuthTryAgainState());
    } catch (e) {
      emit(AuthFailedState(message: e.toString()));
    }
    // emit(AuthInitState());
  }

  void forgetPassword({required email}) async {
    ForgetPasswordRequest model = ForgetPasswordRequest(email: email);

    emit(AuthLoadingState());
    Response? response = await apiService.post(
        EndPoint.forgetPassword, FormData.fromMap(model.toMap()));
    if (response != null) {
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final Map<String, dynamic> json = response.data as Map<String, dynamic>;
        UserResponse user = UserResponse.fromJson(json);
        //save user in cache
        emit(AuthSuccessState());
      } else
        emit(AuthTryAgainState());
    } else
      emit(AuthTryAgainState());
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
      } else
        emit(AuthTryAgainState());
    } else
      emit(AuthTryAgainState());
  }
}
