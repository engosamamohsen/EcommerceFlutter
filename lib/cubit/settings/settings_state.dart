abstract class SettingsStates {}

class SettingsInitState extends SettingsStates {}

class SettingsLoadingState extends SettingsStates {}

class SettingsLoadingButtonState extends SettingsStates {}

class SettingsAddMinusState extends SettingsStates {}

class SettingsSuccessAddMinusState extends SettingsStates {}

class SettingsFailedState extends SettingsStates {
  String message;
  SettingsFailedState({required this.message});
}

class SettingsSuccessState<T> extends SettingsStates {
  final T? data;
  SettingsSuccessState({this.data});
}
