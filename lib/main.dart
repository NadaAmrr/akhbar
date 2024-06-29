import 'package:akhbar/app/my_app.dart';
import 'package:akhbar/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: const MyApp()));
}
