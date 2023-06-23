import 'package:to_do_yandex/data/repository/remote/todo_data_remote_repository.dart';
import 'package:to_do_yandex/internal/dependencies/remote/api_remote_module.dart';
import 'package:to_do_yandex/data/repository/local/todo_data_local_repository.dart';
import 'package:to_do_yandex/internal/dependencies/local/api_local_module.dart';

class RepositoryModule {
  static TodoDataRemoteRepository? _remoteRepository;
  static TodoDataLocalRepository? _localRepository;
  static TodoDataRemoteRepository remoteRepository() {
    _remoteRepository ??= TodoDataRemoteRepository(ApiRemoteModule.apiUtil());
    return _remoteRepository!;
  }

  static TodoDataLocalRepository localRepository() {
    _localRepository ??= TodoDataLocalRepository(ApiLocalModule.apiUtil());
    return _localRepository!;
  }
}
