import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/data/api/service/remote_todo_service.dart';
import '../../domain/models/todo_task.dart';
import '../mapper/remote_todo_task_mapper.dart';

class RemoteApiUtil {
  final RemoteToDoService _remoteToDoService;
  RemoteApiUtil(this._remoteToDoService);

  Future<void> addTask({required TodoTask todoTask}) async {
    await _remoteToDoService.addTask(RemoteTodoTaskMapper.toApi(todoTask));
  }

  Future<void> editTask({required TodoTask todoTask}) async {
    await _remoteToDoService.editTask(RemoteTodoTaskMapper.toApi(todoTask));
  }

  Future<List<TodoTask>> getList() async {
    final tmp = await _remoteToDoService.getList();
    final List<TodoTask> result = [];

    for (ApiRemoteTodoTask task in tmp) {
      result.add(RemoteTodoTaskMapper.fromApi(task));
    }
    return result;
  }

  Future<TodoTask?> getTask({required String taskId}) async {
    final result = await _remoteToDoService.getTask(taskId);
    return result == null ? null : RemoteTodoTaskMapper.fromApi(result);
  }

  Future<void> removeTask({required String taskId}) async {
    await _remoteToDoService.removeTask(taskId);
  }

  Future<List<TodoTask>> updateList({required List<TodoTask> todoTasks}) async {
    final List<ApiRemoteTodoTask> remoteTasks = [];
    for (TodoTask task in todoTasks) {
      remoteTasks.add(RemoteTodoTaskMapper.toApi(task));
    }
    final tmp = await _remoteToDoService.updateList(remoteTasks);
    final List<TodoTask> result = [];

    for (ApiRemoteTodoTask task in tmp) {
      result.add(RemoteTodoTaskMapper.fromApi(task));
    }
    return result;
  }
}
