import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/colors.dart';
import 'package:notes_app/views/landing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          actionsIconTheme: IconThemeData(color: AppColors.lightTextColor),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.buttonColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: AppColors.lightTextColor,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 3, color: AppColors.orange),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColors.orange,
        ),
        brightness: Brightness.dark,
        backgroundColor: AppColors.containerBackground,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        fontFamily: GoogleFonts.poppins().fontFamily,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 50),
            backgroundColor: AppColors.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LandingView(),
    );
  }
}
