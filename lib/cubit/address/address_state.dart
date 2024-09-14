abstract class AddressStates {}

class AddressInitState extends AddressStates {}

class AddressLoadingState extends AddressStates {}

class AddressLoadingButtonState extends AddressStates {}

class AddressFailedState extends AddressStates {
  String message;
  AddressFailedState({required this.message});
}

class AddressSuccessState<T> extends AddressStates {
  final T data;
  AddressSuccessState({required this.data});
}
