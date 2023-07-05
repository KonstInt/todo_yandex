import 'package:flutter/material.dart';

class MyConstants {
  static const baseUrl = "https://beta.mrdekk.ru/todobackend";
  static const keyLocalRevision = "lrevision";
  static const keyRemoteRevision = "rrevision";
  static const keyUnSynchronized = "unsynchronized";
  //TODO: input your token
  static const keyBearer = "classman";
}

class MyColorsLight {
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

class MyAssets {
  static const String kHighPriorityIcon = 'assets/icons/high_priority.svg';
  static const String kLowPriorityIcon = 'assets/icons/low_priority.svg';
  static const String kInfoOutlinedIcon = 'assets/icons/info_outlined.svg';
  static const String kEyeIcon = 'assets/icons/eye.svg';
  static const String kEyeCrossIcon = 'assets/icons/eye_cross.svg';
  static const String kDoneIcon = 'assets/icons/done.svg';
  static const String kRubbishIcon = 'assets/icons/rubbish.svg';
}

class MyFunctions {
  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}
