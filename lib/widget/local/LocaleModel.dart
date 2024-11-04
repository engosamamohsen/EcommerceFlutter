import 'package:flutter/cupertino.dart';

import '../../db_helper/app_storage.dart';

class LocaleModel extends ChangeNotifier {
  AppStorageShared sharedPreferences = AppStorageShared();
  Locale? _locale;

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}