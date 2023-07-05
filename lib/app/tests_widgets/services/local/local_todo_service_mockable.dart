import 'package:mockito/mockito.dart';
import 'package:to_do_yandex/data/api/model/local/api_local_todo_task.dart';
import 'package:to_do_yandex/data/api/service/local_todo_service.dart';

class MockLocalToDoService extends Mock implements LocalToDoService {
  MockLocalToDoService();
  List<ApiLocalTodoTask> localTodoTasks = [];
  @override
  Future<List<ApiLocalTodoTask>> getList() async {
    return localTodoTasks;
  }

  @override
  Future<ApiLocalTodoTask?> getTask(String id) async {
    return localTodoTasks.firstWhere((element) => element.id == id);
  }

  @override
  Future<bool> removeTask(String id) async {
    localTodoTasks.removeWhere((element) => element.id == id);
    return true;
  }

  @override
  Future<bool> removeAll() async {
    localTodoTasks = [];
    return true;
  }

  @override
  Future<bool> editOrAddTask(ApiLocalTodoTask task) async {
    int index = localTodoTasks.indexWhere((element) => element.id == task.id);
    if (index > -1) {
      localTodoTasks[index] = task;
    } else {
      localTodoTasks.add(task);
    }
    return true;
  }

  @override
  Future<bool> addAll(List<ApiLocalTodoTask> todoTasks) async {
    int counter = 0;
    for (ApiLocalTodoTask task in todoTasks) {
      if (await editOrAddTask(task)) {
        counter++;
      }
    }
    //if (counter == todoTasks.length) await incLocalRevision();
    return (counter == todoTasks.length);
  }
}
