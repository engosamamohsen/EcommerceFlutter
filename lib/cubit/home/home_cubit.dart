import 'package:auth/cubit/home/home_state.dart';
import 'package:auth/db_helper/app_storage.dart';
import 'package:auth/models/category/categories_response.dart';
import 'package:auth/models/home/home_response.dart';
import 'package:auth/network/api_service.dart';
import 'package:auth/network/end_point.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  ApiService apiService = ApiService();
  AppStorage appStorage = AppStorage();

  void home() async {
    try {
      emit(HomeLoadingState());
      Response? response = await apiService.get(EndPoint.home);
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          HomeResponse homeResponse = HomeResponse.fromJson(json);
          emit(HomeSuccessState<HomeResponse>(data: homeResponse));
          // print(homeResponse.data.categories[0].name);
          print("welcome in home");
          // emit(HomeInitState());
          print("welcome in home part 2");
          // print("start user email ${userSaved.data?.email} ");
        }
      }
    } catch (e) {
      print("start e ${e}");
    }
  }

  void categories() async {
    try {
      emit(CategoriesLoadingState());
      Response? response = await apiService.get(EndPoint.categories);
      print("start post call cubit");

      if (response != null) {
        print("start post call cubit not null");
        if (response.statusCode == 200 &&
            response.data is Map<String, dynamic>) {
          print("start post call cubit not null dynamic");
          final Map<String, dynamic> json =
              response.data as Map<String, dynamic>;
          CategoriesResponse homeResponse = CategoriesResponse.fromJson(json);
          emit(CategoriesSuccessState<CategoriesResponse>(data: homeResponse));
          // print(homeResponse.data.categories[0].name);
          print("welcome in home");
          // emit(HomeInitState());
          print("welcome in home part 2");
          // print("start user email ${userSaved.data?.email} ");
        }
      }
    } catch (e) {
      emit(FailedState());
    }
  }
}
