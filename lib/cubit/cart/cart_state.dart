abstract class CartStates {}

class CartInitState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartDeteteState extends CartStates {}

class CartAddMinusState extends CartStates {}

class CartSuccessAddMinusState extends CartStates {}

class CartFailedState extends CartStates {
  String message;
  CartFailedState({required this.message});
}

class CartSuccessState<T> extends CartStates {
  final T? data;
  CartSuccessState({this.data});
}
