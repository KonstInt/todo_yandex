import 'package:to_do_yandex/data/api/local_api_util.dart';
import 'package:to_do_yandex/data/api/service/local_todo_service.dart';

class ApiLocalModule {
  static LocalApiUtil? _apiUtil;

  static LocalApiUtil apiUtil() {
    _apiUtil ??= LocalApiUtil(LocalTodoService());
    return _apiUtil!;
  }
}
