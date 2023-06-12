import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData basicThemeData() => ThemeData(
    colorScheme: const ColorScheme.light(
      primary: MyColors.kGreenColor,
      secondary: MyColors.kGreyColor,
      shadow: MyColors.kShadowGreyColor,
      onBackground: MyColors.kWhiteColor,
      background: MyColors.kGreyBackground,
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: MyColors.kWhiteColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    primaryColor: MyColors.kGreenColor,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.yesevaOne(
        textStyle: TextStyle(
          color: MyColors.kBlackColor,
          fontWeight: FontWeight.w400,
          fontSize: 24,
        ),
      ),
      titleMedium: GoogleFonts.jost(
        textStyle: TextStyle(
          color: MyColors.kBlackColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
      bodyMedium: GoogleFonts.jost(
        textStyle: TextStyle(
          color: MyColors.kBlackColor,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: MyColors.kLightGreyColor),
    primaryIconTheme: const IconThemeData(
      color: MyColors.kGreenColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.all(const Color.fromARGB(60, 255, 255, 255)),
        animationDuration: const Duration(milliseconds: 10),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(68),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          MyColors.kGreenColor,
        ),
        foregroundColor: MaterialStateProperty.all(MyColors.kWhiteColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(68),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          MyColors.kGreenColor,
        ),
        foregroundColor: MaterialStateProperty.all(MyColors.kWhiteColor),
      ),
    ));
