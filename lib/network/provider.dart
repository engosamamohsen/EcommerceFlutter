import 'package:flutter/material.dart';

class ProgressProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void showProgress() {
    _isLoading = true;
    notifyListeners();
  }

  void hideProgress() {
    _isLoading = false;
    notifyListeners();
  }
}
