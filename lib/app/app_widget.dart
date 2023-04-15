import 'package:flutter/material.dart';
import 'package:interview_pilar/app/presentation/pages/splash_page.dart';
import 'package:interview_pilar/core/theme/pilar_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => 'Pilar',
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: PilarColor.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: PilarColor.primary,
          hintStyle: const TextStyle(
            color: PilarColor.second,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: PilarColor.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: PilarColor.second,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: const BorderSide(
              color: PilarColor.primary,
            ),
          ),
        ),
      ),
    );
  }
}
