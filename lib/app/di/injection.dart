import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/firebase/firebase_config.dart';
import 'package:to_do_yandex/app/firebase/firebase_mock_config.dart';
import 'package:to_do_yandex/app/firebase/firebase_prod_config.dart';
import 'package:to_do_yandex/app/logger.dart';
import 'package:to_do_yandex/app/navigation/route_information_parser.dart';
import 'package:to_do_yandex/app/navigation/router_delegate.dart';
import 'package:to_do_yandex/app/tests_widgets/services/local/local_todo_service_mockable.dart';
import 'package:to_do_yandex/app/tests_widgets/services/remote/remote_todo_service_mockable.dart';
import 'package:to_do_yandex/app/tests_widgets/services/sharedprefs/shared_prefs_servise_mockable.dart';
import 'package:to_do_yandex/data/api/local_api_util.dart';
import 'package:to_do_yandex/data/api/service/local_todo_service.dart';
import 'package:to_do_yandex/data/api/service/shared_prefs_service.dart';
import 'package:to_do_yandex/data/api/shared_prefs_api_util.dart';
import 'package:to_do_yandex/data/repository/remote/todo_data_remote_repository.dart';
import 'package:to_do_yandex/data/repository/shared_prefs/shared_prefs_data_repository.dart';
import 'package:to_do_yandex/domain/repository/abstract_shared_prefs_repository.dart';
import 'package:to_do_yandex/domain/repository/abstract_to_do_tasks_repository.dart';
import 'package:to_do_yandex/firebase_options.dart';
import '../../data/api/remote_api_util.dart';
import '../../data/api/service/remote_todo_service.dart';
import '../../data/repository/local/todo_data_local_repository.dart';

Future<void> setUpDI(DIOptions options) async {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<MyRouterDelegate>(() => MyRouterDelegate());
  getIt.registerLazySingleton<CustomRouteInformationParser>(
      () => CustomRouteInformationParser());

  switch (options) {
    ///DEV OPTIONS
    case DIOptions.dev:
      await _setUpDev(getIt);
      break;

    ///PROD OPTIONS
    case DIOptions.prod:
      await _setUpProd(getIt);
      break;

    ///TEST OPTIONS
    case DIOptions.test:
      await _setUpTest(getIt);
      break;
  }
}

enum DIOptions { test, prod, dev }

Future<void> initFirebase() async {
  logger.d('Firebase initialization started');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  logger.d('Firebase initialized');
}

///SETUP DEV
Future<void> _setUpDev(GetIt getIt) async {
  await initFirebase();
  getIt.registerLazySingleton<FAnalytic>(() => FAnalyticProd());
  getIt.registerLazySingleton<FRemoteConfigs>(() => FRemoteConfigsProd());
  getIt.registerLazySingleton<FirebaseAppConfig>(
    () => FirebaseAppConfigProd(
      GetIt.I<FAnalytic>(),
      GetIt.I<FRemoteConfigs>(),
    ),
  );
  await GetIt.I<FirebaseAppConfig>().initRemoteConfigDev();
  GetIt.I<FirebaseAppConfig>().initCrashlytics();
  getIt.registerLazySingleton<AbstractTodoTasksRepository>(
    () => TodoDataRemoteRepository(
      RemoteApiUtil(
        RemoteToDoService(),
      ),
    ),
    instanceName: "RemoteRepository",
  );
  getIt.registerLazySingleton<AbstractTodoTasksRepository>(
    () => TodoDataLocalRepository(
      LocalApiUtil(
        LocalToDoService(),
      ),
    ),
    instanceName: "LocalRepository",
  );

  getIt.registerLazySingleton<AbstractSharedPrefsRepository>(
    () => SharedPrefsDataRepository(
      SharedPrefsApiUtil(
        SharedPrefsService(),
      ),
    ),
    instanceName: "SharedPrefsRepository",
  );
}

///SETUP PROD
Future<void> _setUpProd(GetIt getIt) async {
  await initFirebase();
  getIt.registerLazySingleton<FAnalytic>(() => FAnalyticProd());
  getIt.registerLazySingleton<FRemoteConfigs>(() => FRemoteConfigsProd());
  getIt.registerLazySingleton<FirebaseAppConfig>(
    () => FirebaseAppConfigProd(
      GetIt.I<FAnalytic>(),
      GetIt.I<FRemoteConfigs>(),
    ),
  );
  await GetIt.I<FirebaseAppConfig>().initRemoteConfigProd();
  GetIt.I<FirebaseAppConfig>().initCrashlytics();
  getIt.registerLazySingleton<AbstractTodoTasksRepository>(
    () => TodoDataRemoteRepository(
      RemoteApiUtil(
        RemoteToDoService(),
      ),
    ),
    instanceName: "RemoteRepository",
  );
  getIt.registerLazySingleton<AbstractTodoTasksRepository>(
    () => TodoDataLocalRepository(
      LocalApiUtil(
        LocalToDoService(),
      ),
    ),
    instanceName: "LocalRepository",
  );

  getIt.registerLazySingleton<AbstractSharedPrefsRepository>(
    () => SharedPrefsDataRepository(
      SharedPrefsApiUtil(
        SharedPrefsService(),
      ),
    ),
    instanceName: "SharedPrefsRepository",
  );
}

///SETUP TEST
Future<void> _setUpTest(GetIt getIt) async {
  getIt.registerLazySingleton<FAnalytic>(() => FAnalyticMock());
  getIt.registerLazySingleton<FRemoteConfigs>(() => FRemoteConfigsMock());
  getIt.registerLazySingleton<FirebaseAppConfig>(
    () => FirebaseAppConfigMock(
      GetIt.I<FAnalytic>(),
      GetIt.I<FRemoteConfigs>(),
    ),
  );
  getIt.registerSingleton<LocalToDoService>(MockLocalToDoService());
  getIt.registerSingleton<RemoteToDoService>(MockRemoteToDoService());
  getIt.registerSingleton<SharedPrefsService>(MockSharedPrefsService());
  getIt.registerLazySingleton<AbstractTodoTasksRepository>(
    () => TodoDataRemoteRepository(
      RemoteApiUtil(
        GetIt.I<RemoteToDoService>(),
      ),
    ),
    instanceName: "RemoteRepository",
  );
  getIt.registerLazySingleton<AbstractTodoTasksRepository>(
    () => TodoDataLocalRepository(
      LocalApiUtil(
        GetIt.I<LocalToDoService>(),
      ),
    ),
    instanceName: "LocalRepository",
  );

  getIt.registerLazySingleton<AbstractSharedPrefsRepository>(
    () => SharedPrefsDataRepository(
      SharedPrefsApiUtil(
        GetIt.I<SharedPrefsService>(),
      ),
    ),
    instanceName: "SharedPrefsRepository",
  );
}
