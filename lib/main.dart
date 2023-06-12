import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/main_screen.dart';
import 'package:to_do_yandex/utils/light_theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'to_do',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ru'),
      ],
      theme: lightThemeData(),
      home: const MainScreen(),
    );
  }
}

