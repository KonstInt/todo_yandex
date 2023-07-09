import 'package:get_it/get_it.dart';
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
import '../../data/api/remote_api_util.dart';
import '../../data/api/service/remote_todo_service.dart';
import '../../data/repository/local/todo_data_local_repository.dart';

void setUpDI(DIOptions options) {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<MyRouterDelegate>(() => MyRouterDelegate());
  getIt.registerLazySingleton<CustomRouteInformationParser>(
      () => CustomRouteInformationParser());
  switch (options) {
    ///DEV OPTIONS
    case DIOptions.dev:
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
      break;

    ///PROD OPTIONS
    case DIOptions.prod:
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
      break;

    ///TEST OPTIONS
    case DIOptions.test:
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
      break;
  }
}

enum DIOptions { test, prod, dev }
