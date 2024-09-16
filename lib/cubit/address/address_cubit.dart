import 'package:auth/cubit/address/address_state.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/models/address/add_address_request.dart';
import 'package:auth/models/address/add_address_response.dart';
import 'package:auth/models/address/address_list_response.dart';
import 'package:auth/models/address/governates_response.dart';
import 'package:auth/models/response/base_response.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class AddressCubit extends Cubit<AddressStates> {
  AddressCubit() : super(AddressInitState());

  ApiService apiService = ApiService();
  AppStorage appStorage = AppStorage();

  void addAddress(AddAddressRequest address) async {
    try {
      emit(AddressLoadingButtonState());
      // Map<String, dynamic> queryParameters = address.toMap();
      Response? response = await apiService.post(
          EndPoint.addAddress, FormData.fromMap(address.toMap()));

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          AddAddressResponse AddressResponse =
              AddAddressResponse.fromJson(json);
          print("start get call cubit not null dynamic from json");

          emit(AddressSuccessState<AddAddressResponse>(data: AddressResponse));
        } else
          emit(AddressInitState());
      }
    } catch (e) {
      print(
          "start get call cubit not null dynamic from json error ${e.toString()}");

      emit(AddressFailedState(message: "${e.toString()}"));
    }
  }

  void getAddressList() async {
    try {
      emit(AddressLoadingState());
      Response? response = await apiService.get(EndPoint.addressList);

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          try {
            AddressListResponse ProductResponse =
                AddressListResponse.fromJson(json);

            emit(AddressSuccessState<AddressListResponse>(
                data: ProductResponse));
            print("start get call cubit after from json emit done");
          } on Exception catch (e) {
            print("error in from json $e");
          }
          print("start get call cubit not null dynamic from json");
        } else
          emit(AddressFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(AddressFailedState(message: "${e.toString()}"));
    }
  }

  void delete(int id) async {
    try {
      // queryParameters
      emit(AddressLoadingState());
      Response? response = await apiService.delete(EndPoint.deleteAddress, id);

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          BaseResponse ProductResponse = BaseResponse.fromJson(json);
          emit(AddressSuccessState<BaseResponse>(data: ProductResponse));
        } else
          emit(AddressFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(AddressFailedState(message: "${e.toString()}"));
    }
  }

  void getGovernates() async {
    try {
      emit(AddressLoadingState());
      Response? response = await apiService.get(EndPoint.governorates);

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          GovernoratesResponse ProductResponse =
              GovernoratesResponse.fromJson(json);
          emit(
              AddressSuccessState<GovernoratesResponse>(data: ProductResponse));
        } else
          emit(AddressFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(AddressFailedState(message: "${e.toString()}"));
    }
  }
}
