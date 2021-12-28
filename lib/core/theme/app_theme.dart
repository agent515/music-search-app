// UI Theme configuration of the app.
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_search_app/core/constants/color_constants.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: 24.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headline4: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headline5: GoogleFonts.openSans(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return AppColors.black;
          },
        ),
      ),
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.black,
        backgroundColor: AppColors.white,
        elevation: 2.0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.darkPink,
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: AppColors.white,
        backgroundColor: Colors.grey[900],
        elevation: 2.0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.darkPink,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.darkPink,
      ),
      textTheme: darkTextTheme,
    );
  }
}
