import 'package:akhbar/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// === AppBar base theme
  static const AppBarTheme _appBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ))
  );

  /// ==== Base text theme
  static const TextTheme _baseTextTheme = TextTheme(
    /// Title large
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),

    /// Title Medium
    titleMedium: TextStyle(
        fontSize: 22, fontFamily: 'Inter', fontWeight: FontWeight.w700),

    /// Title Small
    titleSmall: TextStyle(
        fontSize: 20, fontFamily: 'Inter', fontWeight: FontWeight.w400),

    /// Body Large
    bodyLarge: TextStyle(
        fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400),

    /// Body Medium
    bodyMedium: TextStyle(
        fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400),

    /// Body small
    bodySmall: TextStyle(
        fontSize: 20, fontFamily: 'Poppins', fontWeight: FontWeight.w400),
  );

  /// ==== Base theme
  static final ThemeData _baseTheme = ThemeData(
    primaryColor: AppColors.main,
    primaryColorDark: AppColors.mainDark,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: Colors.transparent,
    textTheme: _baseTextTheme,
  );

  /// ==== Divider base theme
  static const DividerThemeData _divider = DividerThemeData(
    thickness: 3,
  );

  /// ==== Light theme
  static ThemeData lightTheme = _baseTheme.copyWith(
    primaryColor: AppColors.main,

    /// App Bar
    appBarTheme: _appBarTheme.copyWith(
      backgroundColor: AppColors.main,
      iconTheme: const IconThemeData(color: Colors.black),
      titleTextStyle: _baseTextTheme.titleLarge?.copyWith(color: AppColors.txtMainLight),
    ),

    /// text theme
    textTheme: _baseTextTheme.copyWith(
      titleLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.txtPrimaryLight),
      titleMedium:
          _baseTextTheme.titleMedium?.copyWith(color: AppColors.txtCategory),
      titleSmall:
          _baseTextTheme.titleSmall?.copyWith(color: AppColors.txtMainLight),
      bodyLarge: _baseTextTheme.bodyLarge
          ?.copyWith(color: AppColors.txtSecondaryLight),
      bodyMedium: _baseTextTheme.bodyMedium
          ?.copyWith(color: AppColors.txtSecondaryLight),
      bodySmall: _baseTextTheme.bodySmall
          ?.copyWith(color: AppColors.txtSecondaryLight),
    ),

    colorScheme: const ColorScheme(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        brightness: Brightness.light),

    /// divider
    dividerTheme: _divider.copyWith(color: AppColors.main),
  );

  /// ==== Dark theme
  static ThemeData darkTheme = _baseTheme.copyWith(
    primaryColor: AppColors.mainDark,

    /// App Bar
    appBarTheme: _appBarTheme.copyWith(
      backgroundColor: AppColors.mainDark,
      iconTheme: const IconThemeData(color: Colors.white),
      titleTextStyle: _baseTextTheme.titleLarge?.copyWith(color: AppColors.txtMainDark),

    ),

    /// text theme
    textTheme: _baseTextTheme.copyWith(
      titleLarge:
          _baseTextTheme.titleLarge?.copyWith(color: AppColors.txtPrimaryDark),
      titleMedium: _baseTextTheme.titleMedium
          ?.copyWith(color: AppColors.txtCategoryDark),
      titleSmall:
          _baseTextTheme.titleSmall?.copyWith(color: AppColors.txtMainDark),
      bodyLarge:
          _baseTextTheme.bodyLarge?.copyWith(color: AppColors.txtSecondaryDark),
      bodyMedium: _baseTextTheme.bodyMedium
          ?.copyWith(color: AppColors.txtSecondaryDark),
      bodySmall:
          _baseTextTheme.bodySmall?.copyWith(color: AppColors.txtSecondaryDark),
    ),
    colorScheme: const ColorScheme(
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimaryDark,
        secondary: AppColors.black,
        onSecondary: AppColors.onSecondary,
        error: AppColors.error,
        onError: AppColors.onError,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        brightness: Brightness.dark),

    /// divider
    dividerTheme: _divider.copyWith(color: AppColors.mainDark),
  );
}
