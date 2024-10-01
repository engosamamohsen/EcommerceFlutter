import 'package:Emend/cubit/settings/settings_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/models/cart/request/add_to_cart_request.dart';
import 'package:Emend/models/product/add_wishlist_response.dart';
import 'package:Emend/models/product/product_list_response.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/models/settings/contact_us_request.dart';
import 'package:Emend/network/api_service.dart';
import 'package:Emend/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitState());

  ApiService apiService = ApiService();
  AppStorageShared appStorage = AppStorageShared();

  void getTerms(String name) async {
    try {
      emit(SettingsLoadingState());
      Map<String, String> queryParameters = {"setting_type": name};
      Response? response = await apiService.get(EndPoint.terms,
          queryParameters: queryParameters);

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          try {
            BaseResponse SettingsResponse = BaseResponse.fromJson(json);
            emit(SettingsSuccessState<BaseResponse>(data: SettingsResponse));
          } catch (e) {
            print("start error ${e.toString()}");
          }

          print("start get call cubit not null dynamic from json");
          // SettingsResponse.data.banners.clear();
          print("start slider here");
          // SettingsResponse.data.gallery.asMap().forEach((index, value) {
          //   // SettingsResponse.data.banners
          //   //     .add(Banners(id: value.id, banner: value.image));
          //   print("start slider length ${SettingsResponse.data.gallery.length}");
          // });
        } else
          emit(SettingsFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(SettingsFailedState(message: "${e.toString()}"));
    }
  }

  void contactUs(
      String name, String phone, String email, String message) async {
    try {
      print("welcome 22");
      ContactRequest request = new ContactRequest(
          name: name, phone: phone, email: email, message: message);
      emit(SettingsLoadingButtonState());
      // Map<String, int> queryParameters = {"product_id": id, "count": count};
      Response? response = await apiService.post(
          EndPoint.contactUs, FormData.fromMap(request.toMap()));

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          BaseResponse productResponse = BaseResponse.fromJson(json);
          emit(SettingsSuccessState<BaseResponse>(data: productResponse));
          emit(SettingsInitState());
        } else
          emit(SettingsFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(SettingsFailedState(message: "${e.toString()}"));
    }
  }
}
