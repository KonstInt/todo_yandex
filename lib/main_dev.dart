import 'package:flutter/material.dart';
import 'package:to_do_yandex/app/di/injection.dart';
import 'app/app.dart';

void main() async {
  await setUpDI(DIOptions.dev);
  runApp(const App());
}
