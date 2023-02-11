import 'package:car/ui/auth/sign_in/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'theme/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var defultTexStyle = GoogleFonts.inder();
    return MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          flc.CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
        ],
        debugShowCheckedModeBanner: false,
        title: 'Car Rental',
        theme: ThemeData(
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF16161A)),
          cardColor: const Color(0xFF94A1B2),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: LightThemeColors.primariIconColor,
              )),
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
              headlineMedium: const TextStyle(
                  color: LightThemeColors.lightTetxcolor, fontSize: 18),
              headlineSmall: defultTexStyle.copyWith(
                  color: LightThemeColors.subTitlteTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 10),
              titleLarge: defultTexStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: LightThemeColors.primaryTextColor),
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
        home: const SignInScreen());
  }
}
