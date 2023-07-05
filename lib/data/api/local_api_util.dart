import 'package:to_do_yandex/data/api/model/local/api_local_todo_task.dart';
import 'package:to_do_yandex/data/api/service/local_todo_service.dart';
import 'package:to_do_yandex/data/mapper/local_todo_task_mapper.dart';
import '../../domain/models/todo_task.dart';

class LocalApiUtil {
  final LocalToDoService _localTodoService;
  LocalApiUtil(this._localTodoService);

/*
  Future<bool> addAll(List<TodoTask> todoTasks) async {
    final List<ApiLocalTodoTask> localTodoTasks = [];
    for (TodoTask task in todoTasks) {
      localTodoTasks.add(LocalTodoTaskMapper.toApi(task));
    }
    return await _localTodoService.addAll(localTodoTasks);
  }
*/
  Future<void> addTask(
      {required TodoTask todoTask, bool isSynchronized = false}) async {
    final ApiLocalTodoTask localTodoTask =
        LocalTodoTaskMapper.toApi(todoTask, isSynchronized);
    await _localTodoService.editOrAddTask(localTodoTask);
  }

  Future<void> editTask(
      {required TodoTask todoTask, bool isSynchronized = false}) async {
    final ApiLocalTodoTask localTodoTask =
        LocalTodoTaskMapper.toApi(todoTask, isSynchronized);
    await _localTodoService.editOrAddTask(localTodoTask);
  }

  Future<List<TodoTask>> getList() async {
    final tmp = await _localTodoService.getList();
    final List<TodoTask> result = [];
    for (ApiLocalTodoTask task in tmp) {
      result.add(LocalTodoTaskMapper.fromApi(task));
    }
    return result;
  }

  Future<TodoTask?> getTask({required String taskId}) async {
    final result = await _localTodoService.getTask(taskId);
    return result == null ? null : LocalTodoTaskMapper.fromApi(result);
  }

  Future<void> removeTask({required String taskId}) async {
    await _localTodoService.removeTask(taskId);
  }

  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks}) async {
    await _localTodoService.removeAll();
    final List<ApiLocalTodoTask> localTasks = [];
    for (TodoTask task in todoTasks) {
      localTasks.add(LocalTodoTaskMapper.toApi(task, true));
    }
    await _localTodoService.addAll(localTasks);
    return await getList();
  }
}
