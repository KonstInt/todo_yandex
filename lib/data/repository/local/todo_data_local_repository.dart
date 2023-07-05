import 'package:to_do_yandex/data/api/local_api_util.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/abstract_to_do_tasks_repository.dart';

class TodoDataLocalRepository extends AbstractTodoTasksRepository {
  final LocalApiUtil _localApiUtil;
  TodoDataLocalRepository(this._localApiUtil);

  @override
  Future<void> addTask(
      {required TodoTask todoTask, bool isSynchronized = false}) async {
    return _localApiUtil.addTask(
        todoTask: todoTask, isSynchronized: isSynchronized);
  }

  @override
  Future<void> editTask(
      {required TodoTask todoTask, bool isSynchronized = false}) {
    return _localApiUtil.editTask(
        todoTask: todoTask, isSynchronized: isSynchronized);
  }

  @override
  Future<List<TodoTask>> getList() {
    return _localApiUtil.getList();
  }

  @override
  Future<TodoTask?> getTask({required String taskId}) {
    return _localApiUtil.getTask(taskId: taskId);
  }

  @override
  Future<void> removeTask({required String taskId}) {
    return _localApiUtil.removeTask(taskId: taskId);
  }

  @override
  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks}) {
    return _localApiUtil.updateList(todoTasks: todoTasks);
  }
}
