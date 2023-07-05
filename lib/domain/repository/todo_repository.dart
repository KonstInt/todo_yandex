import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/domain/exceptions/my_exceptions.dart';
import 'package:to_do_yandex/domain/repository/abstract_shared_prefs_repository.dart';
import 'package:to_do_yandex/domain/repository/abstract_to_do_tasks_repository.dart';
import '../models/todo_task.dart';

class TodoRepository {
  late final AbstractTodoTasksRepository localRepository;
  late final AbstractTodoTasksRepository remoteRepository;
  TodoRepository() {
    localRepository = GetIt.I
        .get<AbstractTodoTasksRepository>(instanceName: "LocalRepository");
    remoteRepository = GetIt.I
        .get<AbstractTodoTasksRepository>(instanceName: "RemoteRepository");
  }

  Future<List<TodoTask>> getAndMergeTasks() async {
    List<TodoTask> todoTasks = [];
    List<TodoTask> localTmpTasks = [];
    List<TodoTask> remoteTmpTasks = [];

    try {
      //Try to get list from server
      remoteTmpTasks = await remoteRepository.getList();
    } catch (e) {
      final remoteErr = (e as DioException).error;
      //If invalid input
      if (remoteErr is RemoteInvalidServerInputErrorException) {
        throw RemoteInvalidServerInputErrorException();
      }
      if (remoteErr is NoInternetErrorException) {
        try {
          //If no internet then return local list
          return await localRepository.getList();
        } catch (e) {
          //If error then db error
          throw DatabaseErrorException();
        }
      }
    }
    //If internet synchronize successful
    try {
      //Load local list
      localTmpTasks = await localRepository.getList();
    } catch (e) {
      //If error then db error
      throw DatabaseErrorException();
    }
    todoTasks = await _mergeTasks(local: localTmpTasks, remote: remoteTmpTasks);

    try {
      //Try put merged tasks to server
      await remoteRepository.updateList(todoTasks: todoTasks);
    } catch (e) {
      final remoteErr = (e as DioException).error;
      //If invalid input
      if (remoteErr is RemoteInvalidServerInputErrorException) {
        throw RemoteInvalidServerInputErrorException();
      }
    }
    try {
      //Try put merged tasks to local db
      await localRepository.updateList(todoTasks: todoTasks);
    } catch (e) {
      //If error then db error
      throw DatabaseErrorException();
    }

    return todoTasks;
  }

  Future<void> editTask(TodoTask changedTask) async {
    try {
      //Try to change task on server
      await remoteRepository.editTask(todoTask: changedTask);
    } catch (e) {
      final remoteErr = (e as DioException).error;
      //If unsynchronized
      if (remoteErr is RemoteUnsynchronizedErrorException) {
        //Synchronized them
        await getAndMergeTasks();
        //Try again
        return editTask(changedTask);
      }
      //If invalid input
      if (remoteErr is RemoteInvalidServerInputErrorException) {
        throw RemoteInvalidServerInputErrorException();
      }
      if (remoteErr is NoInternetErrorException) {
        try {
          //If no internet then write to local db with unsynchronized flag
          return await localRepository.editTask(
              todoTask: changedTask, isSynchronized: false);
        } catch (e) {
          //If error then db error
          throw DatabaseErrorException();
        }
      }
      //If after synchronization task was deleted
      if (remoteErr is RemotePageNotExistErrorException) {
        return addTask(changedTask);
      }
    }
    //If internet synchronize successful
    try {
      await localRepository.editTask(
          todoTask: changedTask, isSynchronized: true);
    } catch (e) {
      //If error then db error
      throw DatabaseErrorException();
    }
  }

  Future<void> removeTask(String taskId) async {
    try {
      //Try to delete task on server
      await remoteRepository.removeTask(taskId: taskId);
    } catch (e) {
      final remoteErr = (e as DioException).error;
      //If unsynchronized
      if (remoteErr is RemoteUnsynchronizedErrorException) {
        //Synchronized them
        await getAndMergeTasks();
        //Try again
        return removeTask(taskId);
      }
      //If invalid input
      if (remoteErr is RemoteInvalidServerInputErrorException) {
        throw RemoteInvalidServerInputErrorException();
      }
      if (remoteErr is NoInternetErrorException) {
        try {
          //If no internet then write shared prefs id and time
          Map<String, int> deletedItems = await GetIt.I
              .get<AbstractSharedPrefsRepository>(
                  instanceName: "SharedPrefsRepository")
              .getUnSynchronizedDeleted();

          deletedItems.addAll({taskId: DateTime.now().millisecondsSinceEpoch});

          await GetIt.I
              .get<AbstractSharedPrefsRepository>(
                  instanceName: "SharedPrefsRepository")
              .setUnSynchronizedDeleted(deletedItems);
          //And delete it from local
          return await localRepository.removeTask(taskId: taskId);
        } catch (e) {
          //If error then db error
          throw DatabaseErrorException();
        }
      }
      //If after synchronization task was deleted
      if (remoteErr is RemotePageNotExistErrorException) {
        //Then just stop
        return;
      }
    }
    //If internet synchronize successful
    try {
      await localRepository.removeTask(taskId: taskId);
    } catch (e) {
      //If error then db error
      throw DatabaseErrorException();
    }
  }

  Future<void> addTask(TodoTask todoTask) async {
    try {
      //Try to add task on server
      await remoteRepository.addTask(todoTask: todoTask);
    } catch (e) {
      final remoteErr = (e as DioException).error;
      //If unsynchronized
      if (remoteErr is RemoteUnsynchronizedErrorException) {
        //Synchronized them
        await getAndMergeTasks();
        //Try again
        return addTask(todoTask);
      }
      //If invalid input
      if (remoteErr is RemoteInvalidServerInputErrorException) {
        throw RemoteInvalidServerInputErrorException();
      }
      if (remoteErr is NoInternetErrorException) {
        try {
          //If no internet then write to local db with unsynchronized flag
          return await localRepository.addTask(
              todoTask: todoTask, isSynchronized: false);
        } catch (e) {
          //If error then db error
          throw DatabaseErrorException();
        }
      }
    }
    //If internet synchronize successful
    try {
      await localRepository.addTask(
        todoTask: todoTask,
        isSynchronized: true,
      );
    } catch (e) {
      //If error then db error
      throw DatabaseErrorException();
    }
  }

  Future<List<TodoTask>> _mergeTasks(
      {required List<TodoTask> local, required List<TodoTask> remote}) async {
    //Get unsynchronized deleted Tasks ids
    Map<String, int> unsynchronized = await GetIt.I
        .get<AbstractSharedPrefsRepository>(
            instanceName: "SharedPrefsRepository")
        .getUnSynchronizedDeleted();

    List<TodoTask> resultList = [];
    //Get all tasks in local list which wasn't synchronized
    resultList.addAll(local.where((task) => task.isSynchronized == false));

    for (TodoTask task in remote) {
      //Try to find same tasks index
      final int tmpIndex =
          resultList.indexWhere((element) => element.id == task.id);
      //If found
      if (tmpIndex != -1) {
        //Add last updated task
        if (resultList[tmpIndex].changedAt.millisecondsSinceEpoch <
            task.createdAt.millisecondsSinceEpoch) {
          resultList[tmpIndex] = task;
        }
      }
      //If not found
      else {
        //Try to check if we already delete this task in local
        if (unsynchronized.containsKey(task.id)) {
          //If task was local deleted and not updated after it
          if ((unsynchronized[task.id] ?? 0) <
              task.changedAt.millisecondsSinceEpoch) {
            resultList.add(task);
          }
        }
        //If task was deleted but updated after it
        else {
          resultList.add(task);
        }
      }
    }
    return resultList;
  }
}
