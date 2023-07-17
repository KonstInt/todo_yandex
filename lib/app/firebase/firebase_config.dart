import 'package:flutter/material.dart';

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
