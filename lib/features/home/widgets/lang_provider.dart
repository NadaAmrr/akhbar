
import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier {
  String appLang = 'en';

  /// Lang
  void changeLang(String lang) {
    if (appLang == lang) {
      return;
    }
    appLang = lang;
    notifyListeners();
  }
}