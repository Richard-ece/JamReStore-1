import 'package:flutter/material.dart';

class AppLocale extends ChangeNotifier {
  Locale _locale = const Locale('es'); //Default lenguage

  Locale get locale => _locale;

  void changeLocale(Locale newLocale) {
    if (newLocale == const Locale('es')) {
      _locale = const Locale('es');
    } else if (newLocale == const Locale('en')) {
      _locale = const Locale('en');
    }
    notifyListeners();
  }
}
