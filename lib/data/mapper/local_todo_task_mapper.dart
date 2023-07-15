import 'package:to_do_yandex/data/api/model/local/api_local_todo_task.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';

class LocalTodoTaskMapper {
  static TodoTask fromApi(ApiLocalTodoTask task) {
    return TodoTask(
      id: task.id ?? "",
      text: task.text ?? "",
      deadline: task.deadline,
      importance: LocalImportanceMapper.fromApi(task.importance),
      done: task.done ?? false,
      createdAt: task.createdAt ?? DateTime.now(),
      changedAt: task.changedAt ?? DateTime.now(),
      lastUpdatedBy: task.lastUpdatedBy ?? "",
    );
  }

  static ApiLocalTodoTask toApi(TodoTask task) {
    return ApiLocalTodoTask()
      ..id = task.id
      ..text = task.text
      ..importance = LocalImportanceMapper.toApi(task.importance)
      ..deadline = task.deadline
      ..color = task.color.toString()
      ..createdAt = task.createdAt
      ..changedAt = task.changedAt
      ..done = task.done
      ..lastUpdatedBy = task.lastUpdatedBy;
  }
}

class LocalImportanceMapper {
  static TaskPriority fromApi(ApiLocalTaskPriority importance) {
    return switch (importance) {
      ApiLocalTaskPriority.important => TaskPriority.important,
      ApiLocalTaskPriority.low => TaskPriority.low,
      _ => TaskPriority.basic,
    };
  }

  static ApiLocalTaskPriority toApi(TaskPriority importance) {
    return switch (importance) {
      TaskPriority.important => ApiLocalTaskPriority.important,
      TaskPriority.low => ApiLocalTaskPriority.low,
      _ => ApiLocalTaskPriority.basic,
    };
  }
}
