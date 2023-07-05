import 'package:to_do_yandex/data/api/remote_api_util.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/abstract_to_do_tasks_repository.dart';

class TodoDataRemoteRepository extends AbstractTodoTasksRepository {
  final RemoteApiUtil _remoteApiUtil;
  TodoDataRemoteRepository(this._remoteApiUtil);

  @override
  Future<void> addTask(
      {required TodoTask todoTask, bool isSynchronized = false}) {
    return _remoteApiUtil.addTask(todoTask: todoTask);
  }

  @override
  Future<void> editTask(
      {required TodoTask todoTask, bool isSynchronized = false}) {
    return _remoteApiUtil.editTask(todoTask: todoTask);
  }

  @override
  Future<List<TodoTask>> getList() {
    return _remoteApiUtil.getList();
  }

  @override
  Future<TodoTask?> getTask({required String taskId}) {
    return _remoteApiUtil.getTask(taskId: taskId);
  }

  @override
  Future<void> removeTask({required String taskId}) {
    return _remoteApiUtil.removeTask(taskId: taskId);
  }

  @override
  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks}) {
    return _remoteApiUtil.updateList(todoTasks: todoTasks);
  }
}
