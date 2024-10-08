import 'package:Emend/cubit/product/product_state.dart';
import 'package:Emend/db_helper/app_storage.dart';
import 'package:Emend/models/cart/request/add_to_cart_request.dart';
import 'package:Emend/models/product/add_wishlist_response.dart';
import 'package:Emend/models/product/details/product_details_response.dart';
import 'package:Emend/models/product/product_list_response.dart';
import 'package:Emend/models/response/base_response.dart';
import 'package:Emend/network/api_service.dart';
import 'package:Emend/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitState());

  ApiService apiService = ApiService();
  AppStorageShared appStorage = AppStorageShared();

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

          try {
            ProductDetailsResponse ProductResponse =
                ProductDetailsResponse.fromJson(json);
            emit(ProductSuccessState<ProductDetailsResponse>(
                data: ProductResponse));
          } catch (e) {
            print("start error ${e.toString()}");
          }

          print("start get call cubit not null dynamic from json");
          // ProductResponse.data.banners.clear();
          print("start slider here");
          // ProductResponse.data.gallery.asMap().forEach((index, value) {
          //   // ProductResponse.data.banners
          //   //     .add(Banners(id: value.id, banner: value.image));
          //   print("start slider length ${ProductResponse.data.gallery.length}");
          // });
        } else
          emit(ProductFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(ProductFailedState(message: "${e.toString()}"));
    }
  }

  void addToCart(int id, String count) async {
    try {
      print("welcome 22 id: $id , count: $count");

      emit(ProductLoadingAddToCartState());
      var request = AddToCartRequest(
          productId: id, count: (int.parse(count) + 1).toString());
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
          emit(ProductSuccessState<BaseResponse>(data: productResponse));
        } else
          emit(ProductFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(ProductFailedState(message: "${e.toString()}"));
    }
  }

  void addToFavourite(int id) async {
    try {
      print("welcome 22");

      emit(ProductLoadingWishlistState());
      var request = AddToCartRequest(productId: id, count: "0");
      // Map<String, int> queryParameters = {"product_id": id, "count": count};
      Response? response = await apiService.post(
          EndPoint.addToFavourite, FormData.fromMap(request.toMap()));

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          AddWishlistResponse productResponse =
              AddWishlistResponse.fromJson(json);
          print("Done WishList");
          emit(ProductSuccessState<AddWishlistResponse>(data: productResponse));
        } else
          emit(ProductFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(ProductFailedState(message: "${e.toString()}"));
    }
  }

  void getWishList() async {
    try {
      emit(ProductLoadingState());
      Response? response = await apiService.get(EndPoint.wishList);

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          try {
            ProductListResponse ProductResponse =
                ProductListResponse.fromJson(json);

            emit(ProductSuccessState<ProductListResponse>(
                data: ProductResponse));
            print("start get call cubit after from json emit done");
          } on Exception catch (e) {
            print("error in from json $e");
          }
          print("start get call cubit not null dynamic from json");
        } else
          emit(ProductFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(ProductFailedState(message: "${e.toString()}"));
    }
  }

  void getProducts(int categoryId) async {
    try {
      emit(ProductLoadingState());
      // Map<String, dynamic> queryParameters = {};
      Response? response =
          await apiService.get("${EndPoint.productList}$categoryId");

      if (response != null) {
        print("start get call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start get call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          print("start get call cubit not null dynamic ${json}");

          try {
            ProductListResponse ProductResponse =
                ProductListResponse.fromJson(json);

            emit(ProductSuccessState<ProductListResponse>(
                data: ProductResponse));
            print("start get call cubit after from json emit done");
          } on Exception catch (e) {
            print("error in from json $e");
          }
          print("start get call cubit not null dynamic from json");
        } else
          emit(ProductFailedState(message: "Error Loading Please Try Again"));
      }
    } catch (e) {
      emit(ProductFailedState(message: "${e.toString()}"));
    }
  }
}
