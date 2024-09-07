import 'package:auth/generated/l10n.dart';
import 'package:auth/views/auth/login.view.dart';
import 'package:auth/views/home/home_view.dart';
import 'package:auth/views/main/main_screen_view.dart';
import 'package:auth/views/splash/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(useMaterial3: true),
      home: HomeView(),
    );
  }
}
