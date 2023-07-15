import 'package:dio/dio.dart';
import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/utils/constants.dart';

class RemoteToDoService {
  late final Dio dio;
  RemoteToDoService() {
    final options = BaseOptions(
        baseUrl: MyConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 15000),
        headers: {
          "Authorization": "Bearer ${MyConstants.keyBearer}",
        });
    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onResponse: (e, handler) async {
          if (e.statusCode == 200) {
            int currentRevision = await MyFunctions.getRevision();
            int remoteRevision = e.data['revision'] as int;
            if (currentRevision < remoteRevision) {
              await MyFunctions.setRevision(remoteRevision);
            }
          }
          handler.next(e);
        },
      ),
    );
  }

  Future<ApiRemoteTodoTask?> getTodoTask(String id) async {
    final response = await dio.get("/list/$id");
    if (response.statusCode == 200) {
      final data = response.data['element'] as Map<String, dynamic>;
      return ApiRemoteTodoTask.fromApi(data);
    } else {
      return null;
    }
  }

  Future<List<ApiRemoteTodoTask>> getAllTodoTasks() async {
    final response = await dio.get("/list/");
    final data = response.data['list'];

    List<ApiRemoteTodoTask> todoTasksList = [];
    for (Map<String, dynamic> dataProduct in data) {
      todoTasksList.add(ApiRemoteTodoTask.fromApi(dataProduct));
    }
    return todoTasksList;
  }

  Future<List<ApiRemoteTodoTask>> postAllTodoTasks(
      List<ApiRemoteTodoTask> todoTasks) async {
    int i = await MyFunctions.getRevision();
    final List<Map<String, dynamic>> sendBody = [];
    for (ApiRemoteTodoTask task in todoTasks) {
      sendBody.add(task.toApi());
    }
    final response = await dio.patch(
      "/list/",
      data: {"list": sendBody},
      options: Options(headers: {
        "X-Last-Known-Revision": i,
      }),
    );
    final data = response.data['list'];
    List<ApiRemoteTodoTask> todoTasksList = [];
    for (Map<String, dynamic> dataProduct in data) {
      todoTasksList.add(ApiRemoteTodoTask.fromApi(dataProduct));
    }
    return todoTasksList;
  }

  Future<bool> postTodoTask(ApiRemoteTodoTask todoTask) async {
    int i = await MyFunctions.getRevision();
    try {
      final response = await dio.post(
        "/list/",
        data: {"element": todoTask.toApi()},
        options: Options(headers: {
          "X-Last-Known-Revision": i,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.message != null) {
        if (e.message!.contains('400')) {
          throw DioException(
              error: e, requestOptions: e.requestOptions, message: "400");
        }
      }
      return false;
    }
  }

  Future<bool> editTodoTask(ApiRemoteTodoTask todoTask) async {
    int i = await MyFunctions.getRevision();
    todoTask.lastUpdatedBy = DateTime.now().millisecondsSinceEpoch.toString();
    try {
      final response = await dio.put(
        "/list/${todoTask.id}",
        data: {"element": todoTask.toApi()},
        options: Options(headers: {
          "X-Last-Known-Revision": i,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      if (e.message != null) {
        if (e.message!.contains('400')) {
          throw DioException(
              error: e, requestOptions: e.requestOptions, message: "400");
        }
      }
      return false;
    }
  }

  Future<bool> deleteTodoTask(String id) async {
    int i = await MyFunctions.getRevision();
    try {
      final response = await dio.delete(
        "/list/$id",
        options: Options(headers: {
          "X-Last-Known-Revision": i,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      Map<String, int> deletedItems =
          await MyFunctions.getUnSynchronizedDeleted();
      deletedItems.addAll({id: DateTime.now().millisecondsSinceEpoch});
      await MyFunctions.setUnSynchronizedDeleted(deletedItems);
      if (e.message != null) {
        if (e.message!.contains('400')) {
          throw DioException(
              error: e, requestOptions: e.requestOptions, message: "400");
        }
      }
      return false;
    }
  }
}
