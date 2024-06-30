import 'package:akhbar/app/my_app.dart';
import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:akhbar/features/home/provider/home_provider.dart';
import 'package:akhbar/features/home/provider/lang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => HomeProvider()),
    ChangeNotifierProvider(create: (context) => LangProvider()),
  ], child: const MyApp()));
}
