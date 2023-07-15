import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/domain/repository/abstract_shared_prefs_repository.dart';
import 'package:to_do_yandex/app/utils/constants.dart';
import '../../../domain/exceptions/my_exceptions.dart';

class RemoteToDoService {
  late final Dio dio;
  RemoteToDoService() {
    final options = BaseOptions(
        baseUrl: MyConstants.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        headers: {
          "Authorization": "Bearer ${MyConstants.keyBearer}",

        });
    dio = Dio(options);
    dio.interceptors.add(
      ApiRemoteServiceInterceptor(),
    );
  }

  Future<ApiRemoteTodoTask?> getTask(String id) async {
    final response = await dio.get("/list/$id");
    if (response.statusCode == 200) {
      final data = response.data['element'] as Map<String, dynamic>;
      return ApiRemoteTodoTask.fromApi(data);
    } else {
      return null;
    }
  }

  Future<List<ApiRemoteTodoTask>> getList() async {
    final response = await dio.get("/list/");
    final data = response.data['list'];

    List<ApiRemoteTodoTask> todoTasksList = [];
    for (Map<String, dynamic> dataProduct in data) {
      todoTasksList.add(ApiRemoteTodoTask.fromApi(dataProduct));
    }
    return todoTasksList;
  }

  Future<List<ApiRemoteTodoTask>> updateList(
      List<ApiRemoteTodoTask> todoTasks) async {
    int i = await GetIt.I
        .get<AbstractSharedPrefsRepository>(
            instanceName: "SharedPrefsRepository")
        .getRemoteRevision();
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

  Future<void> addTask(ApiRemoteTodoTask todoTask) async {
    int i = await GetIt.I
        .get<AbstractSharedPrefsRepository>(
            instanceName: "SharedPrefsRepository")
        .getRemoteRevision();

    await dio.post(
      "/list/",
      data: {"element": todoTask.toApi()},
      options: Options(headers: {
        "X-Last-Known-Revision": i,
      }),
    );
  }

  Future<void> editTask(ApiRemoteTodoTask todoTask) async {
    int i = await GetIt.I
        .get<AbstractSharedPrefsRepository>(
            instanceName: "SharedPrefsRepository")
        .getRemoteRevision();
    todoTask.lastUpdatedBy = DateTime.now().millisecondsSinceEpoch.toString();

    await dio.put(
      "/list/${todoTask.id}",
      data: {"element": todoTask.toApi()},
      options: Options(headers: {
        "X-Last-Known-Revision": i,
      }),
    );
  }

  Future<bool> removeTask(String id) async {
    int i = await GetIt.I
        .get<AbstractSharedPrefsRepository>(
            instanceName: "SharedPrefsRepository")
        .getRemoteRevision();
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
  }
}

class ApiRemoteServiceInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200) {
      int currentRevision = await GetIt.I
          .get<AbstractSharedPrefsRepository>(
              instanceName: "SharedPrefsRepository")
          .getRemoteRevision();
      int remoteRevision = response.data['revision'] as int;
      if (currentRevision < remoteRevision) {
        await GetIt.I
            .get<AbstractSharedPrefsRepository>(
                instanceName: "SharedPrefsRepository")
            .setRemoteRevision(remoteRevision);
      }
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.message != null) {
      if (err.message!.contains('400')) {
        if (err.response?.data != null) {
          super.onError(
              err.copyWith(error: RemoteUnsynchronizedErrorException()),
              handler);
        } else {
          super.onError(
              err.copyWith(error: RemoteInvalidServerInputErrorException()),
              handler);
        }
      }
      if (err.message!.contains('404')) {
        super.onError(
            err.copyWith(error: RemotePageNotExistErrorException()), handler);
      }
    } else {
      if (err.error is SocketException) {
        super.onError(err.copyWith(error: NoInternetErrorException()), handler);
      }
    }
    super.onError(err, handler);
  }
}
