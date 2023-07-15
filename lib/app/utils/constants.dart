import 'package:flutter/material.dart';

class MyConstants {
  static const baseUrl = "https://beta.mrdekk.ru/todobackend";
  static const keyLocalRevision = "lrevision";
  static const keyRemoteRevision = "rrevision";
  static const keyUnSynchronized = "unsynchronized";
  //TODO: input your token
  //static const keyBearer = "_____";
  //Also u can use it with environment. For that input your token to .vscode/launch.json
  //Or run: flutter run -t lib/main_dev.dart --flavor dev --dart-define=KEY_BEARER=YOUR_TOKEN
  static const keyBearer = String.fromEnvironment("KEY_BEARER");
}

class CommonColors {
  static const Color kColorRed = Color(0xFFFF3B30);
  static const Color kColorGreen = Color(0xFF34C759);
  static const Color kColorBlue = Color(0xFF007AFF);
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
