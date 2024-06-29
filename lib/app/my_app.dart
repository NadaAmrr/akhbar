
import 'package:akhbar/core/theme/app_theme.dart';
import 'package:akhbar/features/categories/categories_screen.dart';
import 'package:akhbar/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: Locale('ar'),
      title: 'Akhbar',
      theme: AppTheme.lightTheme,
      home: CategoriesScreen(),
    );
  }
}

