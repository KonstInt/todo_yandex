import 'package:to_do_yandex/data/api/model/remote/api_remote_todo_task.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';

class RemoteTodoTaskMapper {
  static TodoTask fromApi(ApiRemoteTodoTask task) {
    return TodoTask(
      id: task.id,
      text: task.text,
      deadline: task.deadline == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(task.deadline!),
      importance: RemoteImportanceMapper.fromApi(task.importance),
      done: task.done,
      isSynchronized: true,
      createdAt: DateTime.fromMillisecondsSinceEpoch(task.createdAt),
      changedAt: DateTime.fromMillisecondsSinceEpoch(task.changedAt),
      lastUpdatedBy: task.lastUpdatedBy,
    );
  }

  static ApiRemoteTodoTask toApi(TodoTask task) {
    return ApiRemoteTodoTask.fromData(task);
  }
}

class RemoteImportanceMapper {
  static TaskPriority fromApi(String importance) {
    return switch (importance) {
      'important' => TaskPriority.important,
      'low' => TaskPriority.low,
      _ => TaskPriority.basic,
    };
  }
}
