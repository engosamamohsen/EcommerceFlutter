abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeFailedState extends HomeStates {
  String message;
  HomeFailedState({required this.message});
}

class HomeSuccessState<T> extends HomeStates {
  final T data;
  HomeSuccessState({required this.data});
}

class CategoriesSuccessState<T> extends HomeStates {
  final T data;
  CategoriesSuccessState({required this.data});
}

class CategoriesLoadingState extends HomeStates {}

class FailedState extends HomeStates {}
