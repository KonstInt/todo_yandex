import 'package:to_do_yandex/domain/models/todo_task.dart';

abstract class AbstractTodoTasksRepository {
  Future<void> addTask(
      {required TodoTask todoTask, bool isSynchronized = false});
  Future<TodoTask?> getTask({required String taskId});
  Future<void> editTask(
      {required TodoTask todoTask, bool isSynchronized = false});
  Future<void> removeTask({required String taskId});
  Future<List<TodoTask>> getList();
  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks});
}
