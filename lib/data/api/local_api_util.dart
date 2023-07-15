import 'package:to_do_yandex/data/api/model/local/api_local_todo_task.dart';
import 'package:to_do_yandex/data/api/service/local_todo_service.dart';
import 'package:to_do_yandex/data/mapper/local_todo_task_mapper.dart';

import '../../domain/models/todo_task.dart';

class LocalApiUtil {
  final LocalTodoService _localTodoService;
  LocalApiUtil(this._localTodoService);

  Future<List<TodoTask>> getAll() async {
    final tmp = await _localTodoService.getAll();
    final List<TodoTask> result = [];
    for (ApiLocalTodoTask task in tmp) {
      result.add(LocalTodoTaskMapper.fromApi(task));
    }
    return result;
  }

  Future<TodoTask?> getById(String id) async {
    final result = await _localTodoService.getById(id);
    return result == null ? null : LocalTodoTaskMapper.fromApi(result);
  }

  Future<bool> deleteById(String id) async {
    return await _localTodoService.deleteById(id);
  }

  Future<bool> deleteAll() async {
    return await _localTodoService.deleteAll();
  }

  Future<bool> updateOrAdd(TodoTask task) async {
    final ApiLocalTodoTask localTodoTask = LocalTodoTaskMapper.toApi(task);
    return await _localTodoService.updateOrAdd(localTodoTask);
  }

  Future<bool> addAll(List<TodoTask> todoTasks) async {
    final List<ApiLocalTodoTask> localTodoTasks = [];
    for (TodoTask task in todoTasks) {
      localTodoTasks.add(LocalTodoTaskMapper.toApi(task));
    }
    return await _localTodoService.addAll(localTodoTasks);
  }
}
