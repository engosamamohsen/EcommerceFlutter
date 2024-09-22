abstract class OrderStates {}

class OrderInitState extends OrderStates {}

class OrderLoadingState extends OrderStates {}

class OrderDeteteState extends OrderStates {}

class OrderFailedState extends OrderStates {
  String message;
  OrderFailedState({required this.message});
}

class OrderSuccessState<T> extends OrderStates {
  final T? data;
  OrderSuccessState({this.data});
}
