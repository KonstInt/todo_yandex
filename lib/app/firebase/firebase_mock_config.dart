import 'dart:ui';

import 'package:to_do_yandex/app/firebase/firebase_config.dart';
import 'package:to_do_yandex/app/utils/constants.dart';

class FirebaseAppConfigMock extends FirebaseAppConfig {
  FirebaseAppConfigMock(super.analytics, super.configs);


  @override
  Future<void> initRemoteConfigDev() async {
  }

  @override
  Future<void> initRemoteConfigProd() async {
  }

  @override
  void initCrashlytics() {
  }
}

class FAnalyticMock implements FAnalytic {
  @override
  void analyticDoneEvent() {
   
  }

  @override
  void analyticDeleteEvent() {
   
  }

  @override
  void addTaskEvent() {

  }

  @override
  void routeToMainScreen() {
  
  }

  @override
  void routeToTaskDetailsScreen() {

  }

  @override
  void routeToAddTaskScreen() {
    
  }

  @override
  void routeToUnknownScreen() {
  }
}

class FRemoteConfigsMock implements FRemoteConfigs{
  @override
  Color getRemoteConfigImportantColor() {
   return CommonColors.kColorRed;
  }
}
