import 'package:to_do_yandex/domain/models/todo_task.dart';

abstract class TodoTaskRemoteRepository {
  Future<bool> addTask({required TodoTask todoTask});
  Future<TodoTask?> getTask({required String taskId});
  Future<bool> editTask({required TodoTask todoTask});
  Future<bool> removeTask({required String taskId});
  Future<List<TodoTask>> getList();
  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks});
}
