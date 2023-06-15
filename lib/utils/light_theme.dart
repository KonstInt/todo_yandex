import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData lightThemeData() => ThemeData(
      colorScheme: const ColorScheme.light(
        primary: MyColorsLight.kColorBlue,
        secondary: MyColorsLight.kColorBlue,
        shadow: MyColorsLight.kColorGrayLight,
        onBackground: MyColorsLight.kColorBackElevated,
        background: MyColorsLight.kColorBackPrimary,
      ),
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: MyColorsLight.kColorBackPrimary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: MyColorsLight.kColorBackPrimary,
      primaryColor: MyColorsLight.kColorBlue,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: MyColorsLight.kLabelPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 32,
            height: 38/32,
          ),
        ),
        titleMedium: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: MyColorsLight.kLabelPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 20,
            height: 32/20,
          ),
        ),
        bodyMedium: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: MyColorsLight.kLabelPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 20/16,
          ),
        ),
        bodySmall: GoogleFonts.roboto(
          textStyle:const TextStyle(
            color: MyColorsLight.kLabelPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 20/14,
          ),
        ),
        labelLarge: GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: MyColorsLight.kLabelPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 14,
            height: 24/14,
          ),
        ),

      ),
      textSelectionTheme:TextSelectionThemeData(
        
        selectionColor: MyColorsLight.kColorBlue.withOpacity(0.3),
        selectionHandleColor: MyColorsLight.kColorBlue,
      ),
      iconTheme: const IconThemeData(color: MyColorsLight.kLabelTertiary),
      
    );
