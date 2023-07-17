import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/di/injection.dart';
import 'package:to_do_yandex/data/api/local_api_util.dart';
import 'package:to_do_yandex/data/api/model/local/api_local_todo_task.dart';
import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/data/api/remote_api_util.dart';
import 'package:to_do_yandex/data/api/service/local_todo_service.dart';
import 'package:to_do_yandex/data/api/service/remote_todo_service.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/todo_repository.dart';

void main() {
  ///SETUP DI
  setUpDI(DIOptions.test);

  group('Check Correct Parser of local tasks', () {
    test('One Task', () async {
      final localApiUtil = LocalApiUtil(GetIt.I<LocalToDoService>());
      final localTodoTask = await localApiUtil.getTask(taskId: 'test 1');
      expect(localTodoTask, tasks[0]);
    });

    test('List Tasks', () async {
      final localApiUtil = LocalApiUtil(GetIt.I<LocalToDoService>());
      final localTodoTasks = await localApiUtil.getList();
      expect(localTodoTasks, tasks);
    });
  });
  GetIt.I<LocalToDoService>().addAll(localApiTasks);
  GetIt.I<RemoteToDoService>().updateList(remoteApiTasks);
  group('Check Correct Parser of remote tasks', () {
    test('One Task', () async {
      final remoteApiUtil = RemoteApiUtil(GetIt.I<RemoteToDoService>());
      final remoteTodoTask = await remoteApiUtil.getTask(taskId: 'test 1');
      expect(remoteTodoTask, tasks[0]);
    });

    test('List Tasks', () async {
      final remoteApiUtil = RemoteApiUtil(GetIt.I<RemoteToDoService>());
      final remoteTodoTasks = await remoteApiUtil.getList();
      expect(remoteTodoTasks, tasks);
    });
  });

  group('Repository Module Check', () {
    final repository = TodoRepository();
    test('Merge test', () async {
      final mergedTasks = await repository.getAndMergeTasks();
      expect(mergedTasks, tasks);
    });

    test('Remove test', () async {
      await repository.removeTask("test 1");
      final mergedTasks = await repository.getAndMergeTasks();
      expect(mergedTasks, tasks.sublist(1));
    });

    test('Add test', () async {
      await repository.addTask(tasks[0]);
      final mergedTasks = await repository.getAndMergeTasks();
      final tasksTmp = tasks.sublist(1);
      tasksTmp.add(tasks[0]);
      tasks = tasksTmp;
      expect(mergedTasks, tasks);
    });

    test('Edit test', () async {
      tasks[0] = tasks[0].copyWith(
          deadline: DateTime.fromMillisecondsSinceEpoch(123456789012));
      await repository.editTask(tasks[0]);
      final mergedTasks = await repository.getAndMergeTasks();
      expect(mergedTasks, tasks);
    });
  });
}

///SET OF LOCAL API_TASKS
List<ApiLocalTodoTask> localApiTasks = [
  ApiLocalTodoTask()
    ..isSynchronized = true
    ..id = "test 1"
    ..text = "test 1"
    ..importance = ApiLocalTaskPriority.basic
    ..deadline = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..createdAt = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..changedAt = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..done = false
    ..lastUpdatedBy = "test device",
  ApiLocalTodoTask()
    ..isSynchronized = true
    ..id = "test 2"
    ..text = "test 2"
    ..importance = ApiLocalTaskPriority.important
    ..deadline = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..createdAt = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..changedAt = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..done = true
    ..lastUpdatedBy = "test device",
  ApiLocalTodoTask()
    ..isSynchronized = true
    ..id = "test 3"
    ..text = "test 3"
    ..importance = ApiLocalTaskPriority.low
    ..deadline = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..createdAt = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..changedAt = DateTime.fromMillisecondsSinceEpoch(1234567890)
    ..done = true
    ..lastUpdatedBy = "test device",
];

///SET OF REMOTE API TASKS
List<ApiRemoteTodoTask> remoteApiTasks = [
  ApiRemoteTodoTask.fromApi({
    "done": false,
    "text": "test 1",
    "last_updated_by": "test device",
    "deadline": 1234567890,
    "changed_at": 1234567890,
    "created_at": 1234567890,
    "id": "test 1",
    "importance": "basic"
  }),
  ApiRemoteTodoTask.fromApi({
    "done": true,
    "text": "test 2",
    "last_updated_by": "test device",
    "deadline": 1234567890,
    "changed_at": 1234567890,
    "created_at": 1234567890,
    "id": "test 2",
    "importance": "important"
  }),
  ApiRemoteTodoTask.fromApi({
    "done": true,
    "text": "test 3",
    "last_updated_by": "test device",
    "deadline": 1234567890,
    "changed_at": 1234567890,
    "created_at": 1234567890,
    "id": "test 3",
    "importance": "low"
  }),
];

///SET OF DOMAIN_TASKS
List<TodoTask> tasks = [
  TodoTask(
    id: "test 1",
    text: "test 1",
    importance: TaskPriority.basic,
    done: false,
    isSynchronized: true,
    deadline: DateTime.fromMillisecondsSinceEpoch(1234567890),
    createdAt: DateTime.fromMillisecondsSinceEpoch(1234567890),
    changedAt: DateTime.fromMillisecondsSinceEpoch(1234567890),
    lastUpdatedBy: "test device",
  ),
  TodoTask(
    id: "test 2",
    text: "test 2",
    importance: TaskPriority.important,
    done: true,
    isSynchronized: true,
    deadline: DateTime.fromMillisecondsSinceEpoch(1234567890),
    createdAt: DateTime.fromMillisecondsSinceEpoch(1234567890),
    changedAt: DateTime.fromMillisecondsSinceEpoch(1234567890),
    lastUpdatedBy: "test device",
  ),
  TodoTask(
    id: "test 3",
    text: "test 3",
    importance: TaskPriority.low,
    done: true,
    isSynchronized: true,
    deadline: DateTime.fromMillisecondsSinceEpoch(1234567890),
    createdAt: DateTime.fromMillisecondsSinceEpoch(1234567890),
    changedAt: DateTime.fromMillisecondsSinceEpoch(1234567890),
    lastUpdatedBy: "test device",
  ),
];
