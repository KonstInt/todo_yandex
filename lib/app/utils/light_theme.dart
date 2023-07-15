import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemeData(BuildContext context) {
  double widthVaue = MediaQuery.of(context).size.width * 0.01;
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: _MyColorsLight.kColorBlue,
      secondary: _MyColorsLight.kColorGray,
      shadow: _MyColorsLight.kColorGrayLight,
      onBackground: _MyColorsLight.kColorBackElevated,
      background: _MyColorsLight.kColorBackPrimary,
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: _MyColorsLight.kColorBackPrimary,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: _MyColorsLight.kColorBackPrimary,
    primaryColor: _MyColorsLight.kColorBlue,
    textTheme: TextTheme(
      titleLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 32,
          height: 38 / 32,
        ),
      ),
      titleMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 20,
          height: 32 / 20,
        ),
      ),
      bodyMedium: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          height: 20 / 16,
        ),
      ),
      bodySmall: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
        ),
      ),
      labelLarge: GoogleFonts.roboto(
        textStyle: const TextStyle(
          color: _MyColorsLight.kLabelPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 24 / 14,
        ),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: _MyColorsLight.kColorBlue.withOpacity(0.3),
      selectionHandleColor: _MyColorsLight.kColorBlue,
    ),
    iconTheme: const IconThemeData(color: _MyColorsLight.kLabelTertiary),
    dividerTheme: const DividerThemeData(color: _MyColorsLight.kSeparatorColor),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return _MyColorsLight.kColorBlue;
          }
          return _MyColorsLight.kColorGray;
        },
      ),
      trackColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return _MyColorsLight.kColorBlue.withOpacity(0.48);
          }
          return _MyColorsLight.kColorGray.withOpacity(0.48);
        },
      ),
      trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return _MyColorsLight.kColorBlue.withOpacity(0.48);
          }
          return _MyColorsLight.kColorGray.withOpacity(0.48);
        },
      ),
    ),
    cardTheme: const CardTheme(
      color: _MyColorsLight.kColorBackSecondary,
      surfaceTintColor: _MyColorsLight.kColorBackSecondary,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: _MyColorsLight.kColorBackPrimary,
      surfaceTintColor: _MyColorsLight.kColorBackPrimary,
    ),
  );
}

class _MyColorsLight {
  static const Color kSeparatorColor = Color(0x33000000);
  static const Color kOverlayColor = Color(0x0F000000);
  static const Color kLabelPrimary = Color(0xFF000000);
  static const Color kLabelSecondary = Color(0x99000000);
  static const Color kLabelTertiary = Color(0x4D000000);
  static const Color kLabelDisable = Color(0x26000000);
  static const Color kColorRed = Color(0xFFFF3B30);
  static const Color kColorGreen = Color(0xFF34C759);
  static const Color kColorBlue = Color(0xFF007AFF);
  static const Color kColorGray = Color(0xFF8E8E93);
  static const Color kColorGrayLight = Color(0xFFD1D1D6);
  static const Color kColorWhite = Color(0xFFFFFFFF);
  static const Color kColorBackPrimary = Color(0xFFF7F6F2);
  static const Color kColorBackSecondary = Color(0xFFFFFFFF);
  static const Color kColorBackElevated = Color(0xFFFFFFFF);
}
