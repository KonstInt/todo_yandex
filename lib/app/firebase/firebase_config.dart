// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

import 'package:to_do_yandex/app/utils/hex_color.dart';

abstract class FirebaseAppConfig {
  final FAnalytic _analytics;
  final FRemoteConfigs _configs;

  FirebaseAppConfig(
    this._analytics,
    this._configs,
  );
  
  FAnalytic get analytics => _analytics;
  FRemoteConfigs get configs => _configs;


  Future<void> initRemoteConfigDev();

  Future<void> initRemoteConfigProd();
  void initCrashlytics();
}

abstract class FAnalytic {
  void analyticDoneEvent();

  void analyticDeleteEvent();

  void addTaskEvent();

  void routeToMainScreen();

  void routeToTaskDetailsScreen();

  void routeToAddTaskScreen();

  void routeToUnknownScreen();
}

abstract class FRemoteConfigs {
  Color getRemoteConfigImportantColor();
}
