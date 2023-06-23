import 'package:to_do_yandex/domain/models/todo_task.dart';

abstract class TodoTaskLocalRepository {
  Future<bool> addTask({required TodoTask todoTask});
  Future<TodoTask?> getTask({required String taskId});
  Future<bool> editTask({required TodoTask todoTask});
  Future<bool> removeTask({required String taskId});
  Future<List<TodoTask>> getList();
  Future<bool> removeAllList();
  Future<bool> addList({required List<TodoTask> tasks});
}
