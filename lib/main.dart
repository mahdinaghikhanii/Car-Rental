import 'package:car/theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var defultTexStyle = GoogleFonts.inder();
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        debugShowCheckedModeBanner: false,
        title: 'Car Rental',
        theme: ThemeData(
          dividerColor: LightThemeColors.borderRadiusColor,
          colorScheme: const ColorScheme.light(
              onPrimaryContainer: Color(0xFFEAECF0),
              onPrimary: LightThemeColors.secoundryPrimaryColor,
              primary: LightThemeColors.primariColor,
              primaryContainer: LightThemeColors.containerPirmary),
          textTheme: TextTheme(
              bodyMedium: defultTexStyle.copyWith(
                color: LightThemeColors.secoundyPrimaryTextColor,
                fontSize: 13,
              ),
              labelMedium: defultTexStyle.copyWith(
                color: LightThemeColors.primariColor,
                fontSize: 13,
              ),
              titleSmall: defultTexStyle.copyWith(
                  fontSize: 13,
                  color: LightThemeColors.primaryTextColor,
                  fontWeight: FontWeight.w500),
              titleMedium: defultTexStyle.copyWith(
                  fontSize: 15,
                  color: LightThemeColors.primaryTextColor,
                  fontWeight: FontWeight.w400)),
        ),
        home: const HomeScreen());
  }
}
