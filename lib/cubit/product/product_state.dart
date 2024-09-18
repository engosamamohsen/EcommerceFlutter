abstract class ProductStates {}

class ProductInitState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductLoadingAddToCartState extends ProductStates {}

class ProductLoadingWishlistState extends ProductStates {}

class ProductFailedState extends ProductStates {
  String message;
  ProductFailedState({required this.message});
}

class ProductSuccessState<T> extends ProductStates {
  final T data;
  ProductSuccessState({required this.data});
}
