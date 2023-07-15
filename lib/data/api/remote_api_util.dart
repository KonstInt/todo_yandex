import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/data/api/service/remote_todo_service.dart';
import '../../domain/models/todo_task.dart';
import '../mapper/remote_todo_task_mapper.dart';

class RemoteApiUtil {
  final RemoteToDoService _remoteToDoService;
  RemoteApiUtil(this._remoteToDoService);

  Future<TodoTask?> getTodoTask(String id) async {
    final result = await _remoteToDoService.getTodoTask(id);
    return result == null ? null : RemoteTodoTaskMapper.fromApi(result);
  }

  Future<List<TodoTask>> getAllTodoTasks() async {
    final tmp = await _remoteToDoService.getAllTodoTasks();
    final List<TodoTask> result = [];

    for (ApiRemoteTodoTask task in tmp) {
      result.add(RemoteTodoTaskMapper.fromApi(task));
    }
    return result;
  }

  Future<List<TodoTask>> putAllTodoTasks(List<TodoTask> todoTasks) async {
    final List<ApiRemoteTodoTask> remoteTasks = [];
    for (TodoTask task in todoTasks) {
      remoteTasks.add(RemoteTodoTaskMapper.toApi(task));
    }
    final tmp = await _remoteToDoService.postAllTodoTasks(remoteTasks);
    final List<TodoTask> result = [];

    for (ApiRemoteTodoTask task in tmp) {
      result.add(RemoteTodoTaskMapper.fromApi(task));
    }
    return result;
  }

  Future<bool> putTodoTask(TodoTask todoTask) async {
    return await _remoteToDoService
        .postTodoTask(RemoteTodoTaskMapper.toApi(todoTask));
  }

  Future<bool> editTodoTask(TodoTask todoTask) async {
    return await _remoteToDoService
        .editTodoTask(RemoteTodoTaskMapper.toApi(todoTask));
  }

  Future<bool> deleteTodoTask(String id) async {
    return await _remoteToDoService.deleteTodoTask(id);
  }
}
