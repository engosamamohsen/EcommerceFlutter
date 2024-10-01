abstract class AuthStates {}

class AuthInitState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthFailedState extends AuthStates {
  String message;
  AuthFailedState({required this.message});
}

class AuthTryAgainState extends AuthStates {
  AuthTryAgainState();
}

class AuthSuccessState<T> extends AuthStates {
  final T? data;
  AuthSuccessState({this.data});
}
