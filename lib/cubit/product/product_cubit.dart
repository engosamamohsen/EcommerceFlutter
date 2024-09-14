import 'package:auth/cubit/product/product_state.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/models/product/details/product_details.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitState());

  ApiService apiService = ApiService();
  AppStorage appStorage = AppStorage();

  void productDetails(int id) async {
    try {
      emit(ProductLoadingState());
      Map<String, int> queryParameters = {"product_id": id};
      Response? response = await apiService.get(EndPoint.productDetails,
          queryParameters: queryParameters);

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          ProductDetailsResponse ProductResponse =
              ProductDetailsResponse.fromJson(json);
          print("start get call cubit not null dynamic from json");
          ProductResponse.data.banners.clear();
          print("start slider here");
          ProductResponse.data.gallery.asMap().forEach((index, value) {
            ProductResponse.data.banners
                .add(Banners(id: value.id, banner: value.image));
            print("start slider length ${ProductResponse.data.banners.length}");
          });
          emit(ProductSuccessState<ProductDetailsResponse>(
              data: ProductResponse));
        } else
          emit(ProductFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(ProductFailedState(message: "${e.toString()}"));
    }
  }
}
