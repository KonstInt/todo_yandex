import 'package:to_do_yandex/data/api/local_api_util.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/local/to_do_tasks_local_repository.dart';

class TodoDataLocalRepository extends TodoTaskLocalRepository {
  final LocalApiUtil _localApiUtil;
  TodoDataLocalRepository(this._localApiUtil);
  @override
  Future<bool> addList({required List<TodoTask> tasks}) async {
    return _localApiUtil.addAll(tasks);
  }

  @override
  Future<bool> addTask({required TodoTask todoTask}) async {
    return _localApiUtil.updateOrAdd(todoTask);
  }

  @override
  Future<bool> editTask({required TodoTask todoTask}) {
    return _localApiUtil.updateOrAdd(todoTask);
  }

  @override
  Future<List<TodoTask>> getList() {
    return _localApiUtil.getAll();
  }

  @override
  Future<TodoTask?> getTask({required String taskId}) {
    return _localApiUtil.getById(taskId);
  }

  @override
  Future<bool> removeAllList() {
    return _localApiUtil.deleteAll();
  }

  @override
  Future<bool> removeTask({required String taskId}) {
    return _localApiUtil.deleteById(taskId);
  }
}
