abstract class AuthStates {}

class AuthInitState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthFailedState extends AuthStates {
  String message;
  AuthFailedState({required this.message});
}

class AuthSuccessState extends AuthStates {}
