import 'package:flutter/material.dart';
import 'package:to_do_yandex/app/app.dart';
import 'package:to_do_yandex/app/di/injection.dart';

void main() {
  setUpDI(DIOptions.test);
  runApp(const App());
}
