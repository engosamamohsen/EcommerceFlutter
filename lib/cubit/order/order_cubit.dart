import 'package:Emend/cubit/order/order_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/models/order/details/order_details_response.dart';
import 'package:Emend/models/order/order_list_response.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/network/api_service.dart';
import 'package:Emend/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(OrderInitState());

  ApiService apiService = ApiService();
  AppStorageShared appStorage = AppStorageShared();

  void getOrders() async {
    try {
      emit(OrderLoadingState());
      Response? response = await apiService.get(EndPoint.orderList);
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          OrdersListResponse order = OrdersListResponse.fromJson(json);

          emit(OrderSuccessState(data: order));

          // OrderListResponse cartList = OrderListResponse.fromJson(json);
          // emit(OrderSuccessState(data: cartList));
        } else
          emit(OrderFailedState(message: "Failed Please Try Again"));
      } else
        emit(OrderFailedState(message: "Failed Please Try Again"));

      print("start post call cubit not init");
    } catch (e) {
      emit(OrderFailedState(message: "${e.toString()}"));
    }

    // emit(OrderInitState());
  }

  void checkout(int addressId, double shipping) async {
    try {
      final _data = <String, dynamic>{};
      _data['address_id'] = addressId;
      _data['shipping'] = shipping;

      emit(OrderLoadingState());
      Response? response =
          await apiService.post(EndPoint.createOrder, FormData.fromMap(_data));
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          BaseResponse order = BaseResponse.fromJson(json);
          emit(OrderSuccessState(data: order));
        } else {
          print("asdasdasdsda");
          emit(OrderFailedState(message: "Failed Please Try Again"));
        }
      } else
        emit(OrderFailedState(message: "Failed Please Try Again"));

      print("start post call cubit not init");
    } catch (e) {
      print("start post call cubit not init here");
      emit(OrderFailedState(message: "${e.toString()}"));
    }

    // emit(OrderInitState());
  }

  void orderDetails(int orderId) async {
    try {
      emit(OrderLoadingState());
      Response? response =
          await apiService.get("${EndPoint.orderDetails}?order_id=$orderId");
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          OrderDetailsResponse order = OrderDetailsResponse.fromJson(json);
          print("start post call cubit not null dynamic plus plus");

          emit(OrderSuccessState(data: order));

          // OrderListResponse cartList = OrderListResponse.fromJson(json);
          // emit(OrderSuccessState(data: cartList));
        } else
          emit(OrderFailedState(message: "Failed Please Try Again"));
      } else
        emit(OrderFailedState(message: "Failed Please Try Again"));

      print("start post call cubit not init");
    } catch (e) {
      emit(OrderFailedState(message: "${e.toString()}"));
    }

    // emit(OrderInitState());
  }
}
