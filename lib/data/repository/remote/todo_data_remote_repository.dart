import 'package:to_do_yandex/data/api/remote_api_util.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/remote/to_do_tasks_remote_repository.dart';

class TodoDataRemoteRepository extends TodoTaskRemoteRepository {
  final RemoteApiUtil _remoteApiUtil;
  TodoDataRemoteRepository(this._remoteApiUtil);

  @override
  Future<bool> addTask({required TodoTask todoTask}) {
    return _remoteApiUtil.putTodoTask(todoTask);
  }

  @override
  Future<bool> editTask({required TodoTask todoTask}) {
    return _remoteApiUtil.editTodoTask(todoTask);
  }

  @override
  Future<List<TodoTask>> getList() {
    return _remoteApiUtil.getAllTodoTasks();
  }

  @override
  Future<TodoTask?> getTask({required String taskId}) {
    return _remoteApiUtil.getTodoTask(taskId);
  }

  @override
  Future<bool> removeTask({required String taskId}) {
    return _remoteApiUtil.deleteTodoTask(taskId);
  }

  @override
  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks}) {
    return _remoteApiUtil.putAllTodoTasks(todoTasks);
  }
}
