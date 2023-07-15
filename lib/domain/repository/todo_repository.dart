import 'dart:io';

import 'package:dio/dio.dart';
import 'package:to_do_yandex/domain/repository/local/to_do_tasks_local_repository.dart';
import 'package:to_do_yandex/domain/repository/remote/to_do_tasks_remote_repository.dart';

import '../../internal/dependencies/repository_module.dart';
import '../../utils/constants.dart';
import '../models/todo_task.dart';

class TodoRepository {
  late final TodoTaskLocalRepository localRepository;
  late final TodoTaskRemoteRepository remoteRepository;
  TodoRepository() {
    localRepository = RepositoryModule.localRepository();
    remoteRepository = RepositoryModule.remoteRepository();
  }

  Future<(int, List<TodoTask>)> getAndMergeTasks() async {
    List<TodoTask> tasks = [];
    List<TodoTask> localTmpTasks = [];
    List<TodoTask> remoteTmpTasks = [];
    int statusCode = 0;
    try {
      localTmpTasks = await localRepository.getList();
      remoteTmpTasks = await remoteRepository.getList();
      //tasks = await remoteRepository.updateList(todoTasks: tasks);
    } catch (e) {
      final tmp = e as DioException;
      if (tmp.error is SocketException) {
        //emit(TodoTaskNoInternetState());
        statusCode = -1;
      } else {
        //emit(TodoTaskErrorState());
        statusCode = -3;
        return (statusCode, <TodoTask>[]);
      }
    }

    if (remoteTmpTasks.isEmpty) {
      tasks = localTmpTasks;
    } else {
      tasks = await _mergeTasks(localTmpTasks, remoteTmpTasks);
    }
    try {
      await remoteRepository.updateList(todoTasks: tasks);
      MyFunctions.setUnSynchronizedDeleted({});
    } catch (e) {
      //emit(TodoTaskNoInternetState());
      statusCode = -1;
    }

    return (statusCode, tasks);
  }

  Future<(int, List<TodoTask>?)> changeTask(TodoTask changedTask) async {
    try {
      await localRepository.editTask(todoTask: changedTask);
      await remoteRepository.editTask(todoTask: changedTask);
      return (0, null);
    } catch (e) {
      final tmp = e as DioException;
      if (tmp.message != null) {
        if (tmp.message!.contains("400")) {
          return (await getAndMergeTasks());
        }
      }
      if (tmp.error is SocketException) {
        return (-1, null);
      } else {
        return (-3, null);
      }
    }
  }

  Future<(int, List<TodoTask>?)> taskRemove(String id) async {
    try {
      await localRepository.removeTask(taskId: id);
      await remoteRepository.removeTask(taskId: id);
      return (0, null);
    } catch (e) {
      final tmp = e as DioException;
      if (tmp.error is SocketException) {
        return (-1, null);
      } else {
        if (tmp.message != null) {
          if (tmp.message!.contains("400")) {
            return (await getAndMergeTasks());
          }
        }
        if (tmp.error is SocketException) {
          return (-1, null);
        } else {
          return (-3, null);
        }
      }
    }
  }

  Future<int> taskAdd(TodoTask task) async {
    try {
      await localRepository.addTask(todoTask: task);
      await remoteRepository.addTask(todoTask: task);
      return 0;
    } catch (e) {
      final tmp = e as DioException;
      if (tmp.error is SocketException) {
        return -1;
      } else {
        return -3;
      }
    }
  }

  Future<List<TodoTask>> _mergeTasks(
      List<TodoTask> tasks1, List<TodoTask> tasks2) async {
    Map<String, int> unsynchronized =
        await MyFunctions.getUnSynchronizedDeleted();
    List<TodoTask> resultList = tasks1;
    for (TodoTask task in tasks2) {
      final int tmpIndex =
          resultList.indexWhere((element) => element.id == task.id);
      if (tmpIndex != -1) {
        if (resultList[tmpIndex].changedAt.millisecondsSinceEpoch <
            task.createdAt.millisecondsSinceEpoch) {
          resultList[tmpIndex] = task;
        }
      } else {
        if (unsynchronized.containsKey(task.id)) {
          if ((unsynchronized[task.id] ?? 0) <
              task.changedAt.millisecondsSinceEpoch) {
            resultList.add(task);
          }
        } else {
          resultList.add(task);
        }
      }
    }
    return resultList;
  }
}
