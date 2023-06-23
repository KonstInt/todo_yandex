import 'package:to_do_yandex/data/api/remote_api_util.dart';
import 'package:to_do_yandex/data/api/service/remote_todo_service.dart';

class ApiRemoteModule {
  static RemoteApiUtil? _apiUtil;

  static RemoteApiUtil apiUtil() {
    _apiUtil ??= RemoteApiUtil(RemoteToDoService());
    return _apiUtil!;
  }
}
