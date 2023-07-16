import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkThemeData(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: _MyColorsDark.kColorBlue,
        secondary: _MyColorsDark.kColorGray,
        shadow: Color.fromARGB(255, 0, 0, 0),
        onBackground: _MyColorsDark.kColorBackElevated,
        background: _MyColorsDark.kColorBackPrimary,
      ),
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _MyColorsDark.kColorBackPrimary,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      scaffoldBackgroundColor: _MyColorsDark.kColorBackPrimary,
      primaryColor: _MyColorsDark.kColorBlue,
      textTheme: TextTheme(
        titleLarge: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _MyColorsDark.kLabelPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 32.sp,
            height: (38 / 32).sp,
          ),
        ),
        titleMedium: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _MyColorsDark.kLabelPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            height: (32 / 20).sp,
          ),
        ),
        bodyMedium: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _MyColorsDark.kLabelPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            height: (20 / 16).sp,
          ),
        ),
        bodySmall: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _MyColorsDark.kLabelPrimary,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            height: (20 / 14).sp,
          ),
        ),
        labelLarge: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: _MyColorsDark.kLabelPrimary,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
            height: (24 / 14).sp,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: _MyColorsDark.kColorBlue.withOpacity(0.3),
        selectionHandleColor: _MyColorsDark.kColorBlue,
      ),
      iconTheme: const IconThemeData(color: _MyColorsDark.kLabelTertiary),
      dividerTheme:
          const DividerThemeData(color: _MyColorsDark.kSeparatorColor),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return _MyColorsDark.kColorBlue;
            }
            return _MyColorsDark.kColorGray;
          },
        ),
        trackColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return _MyColorsDark.kColorBlue.withOpacity(0.48);
            }
            return _MyColorsDark.kColorGray.withOpacity(0.48);
          },
        ),
        trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return _MyColorsDark.kColorBlue.withOpacity(0.48);
            }
            return _MyColorsDark.kColorGray.withOpacity(0.48);
          },
        ),
      ),
      cardTheme: const CardTheme(
        color: _MyColorsDark.kColorBackSecondary,
        surfaceTintColor: _MyColorsDark.kColorBackSecondary,
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: _MyColorsDark.kColorBackSecondary,
        surfaceTintColor: Colors.black,
      ));
}

class _MyColorsDark {
  static const Color kSeparatorColor = Color(0x33FFFFFF);
  static const Color kLabelPrimary = Color(0xFFFFFFFF);
  static const Color kLabelTertiary = Color(0x66FFFFFF);
  static const Color kColorBlue = Color(0xFF0A84FF);
  static const Color kColorGray = Color(0xFF8E8E93);
  static const Color kColorBackPrimary = Color(0xFF161618);
  static const Color kColorBackSecondary = Color(0xFF252528);
  static const Color kColorBackElevated = Color(0xFF3C3C3F);
}
