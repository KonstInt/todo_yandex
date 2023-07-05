import 'package:mockito/mockito.dart';
import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/data/api/service/remote_todo_service.dart';

class MockRemoteToDoService extends Mock implements RemoteToDoService {
  MockRemoteToDoService();
  List<ApiRemoteTodoTask> remoteTasks = [];
  @override
  Future<ApiRemoteTodoTask?> getTask(String id) async {
    return remoteTasks.firstWhere((element) => element.id == id);
  }

  @override
  Future<List<ApiRemoteTodoTask>> getList() async {
    return remoteTasks;
  }

  @override
  Future<List<ApiRemoteTodoTask>> updateList(
      List<ApiRemoteTodoTask> todoTasks) async {
    remoteTasks = [];
    remoteTasks = todoTasks;
    return remoteTasks;
  }

  @override
  Future<void> addTask(ApiRemoteTodoTask todoTask) async {
    remoteTasks.add(todoTask);
  }

  @override
  Future<void> editTask(ApiRemoteTodoTask todoTask) async {
    int index = remoteTasks.indexWhere((element) => element.id == todoTask.id);
    remoteTasks[index] = todoTask;
  }

  @override
  Future<bool> removeTask(String id) async {
    remoteTasks.removeWhere((element) => element.id == id);
    return true;
  }
}
