
import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:akhbar/features/home/home_screen.dart';
import 'package:akhbar/features/home/widgets/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    var providerLang = Provider.of<LangProvider>(context);

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale:  Locale(providerLang.appLang),
      title: 'Akhbar',
      theme: provider.themeData,
      home: HomeScreen(),
    );
  }
}

