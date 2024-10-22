import 'dart:io';
import 'package:Emend/cubit/cart/cart_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/models/cart/cart_list_response.dart';
import 'package:Emend/models/cart/request/add_to_cart_request.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/network/api_service.dart';
import 'package:Emend/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitState());

  ApiService apiService = ApiService();
  AppStorageShared appStorage = AppStorageShared();

  void getCarts() async {
    try {
      print("start is here");
      emit(CartLoadingState());
      Response? response = await apiService.get(EndPoint.cartList);
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          CartListResponse cartList = CartListResponse.fromJson(json);
          print("start post call cubit not null dynamic working");

          emit(CartSuccessState(data: cartList));
        } else
          emit(CartFailedState(message: "Failed Please Try Again"));
      }

      print("start post call cubit not init");
    } catch (e) {
      emit(CartFailedState(message: "${e.toString()}"));
    }

    // emit(CartInitState());
  }

  void deleteCart({required cartId}) async {
    emit(CartLoadingState());
    try {
      Response? response = await apiService.delete(EndPoint.cartRemove, cartId);
      if (response != null) {
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          // final Map<String, dynamic> json =
          //     response.data as Map<String, dynamic>;
          // print("user:$json");
          // BaseResponse user = BaseResponse.fromJson(json);
          //save user in cache
          emit(CartDeteteState());
        } else
          emit(CartFailedState(message: "Failed Please Try Again"));
      }
    } catch (e) {
      emit(CartFailedState(message: "${e.toString()}"));
    }
    // emit(CartInitState());
  }

  void addToCart(int id, String count) async {
    try {
      emit(CartAddMinusState());
      var request = AddToCartRequest(productId: id, count: count);
      // Map<String, int> queryParameters = {"product_id": id, "count": count};
      Response? response = await apiService.post(
          EndPoint.addToCart, FormData.fromMap(request.toMap()));

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          BaseResponse productResponse = BaseResponse.fromJson(json);
          emit(CartSuccessAddMinusState());
        } else
          emit(CartFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(CartFailedState(message: "${e.toString()}"));
    }
  }
}
