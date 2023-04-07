import 'package:flutter/material.dart';


class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("en");
  Locale get locale => _locale;

  void setLocale(Locale value) {
    _locale = value;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale("en");
    notifyListeners();
  }
}
