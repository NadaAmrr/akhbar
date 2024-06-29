import 'package:akhbar/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  /// initially light mode
  ThemeData _themeData = AppTheme.lightTheme;

  /// Get theme
  ThemeData get themeData => _themeData;

  /// is dark
  bool get isDarkMode => _themeData == AppTheme.darkTheme;

  /// is Light
  bool get isLightMode => _themeData == AppTheme.lightTheme;

  /// set theme
  set themeDate(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  /// toggle theme
  void toggleTheme() {
    if (_themeData == AppTheme.lightTheme) {
      themeDate = AppTheme.darkTheme;
    } else {
      themeDate = AppTheme.lightTheme;
    }
  }
}
