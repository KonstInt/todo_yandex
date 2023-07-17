import 'package:to_do_yandex/domain/models/todo_task.dart';

class ApiRemoteTodoTask {
  String id;
  String text;
  String importance;
  int? deadline;
  bool done;
  String? color;
  int createdAt;
  int changedAt;
  String lastUpdatedBy;

  ApiRemoteTodoTask.fromApi(Map<String, dynamic> map)
      : id = map["id"],
        text = map["text"],
        importance = map["importance"],
        done = map["done"],
        deadline = map["deadline"],
        color = map["color"],
        createdAt = map["created_at"],
        changedAt = map["changed_at"],
        lastUpdatedBy = map["last_updated_by"];

  Map<String, dynamic> toApi() => {
        "id": id,
        "text": text,
        "importance": importance,
        "deadline": deadline,
        "done": done,
        "color": color,
        "created_at": changedAt,
        "changed_at": changedAt,
        "last_updated_by": lastUpdatedBy
      };

  ApiRemoteTodoTask.fromData(TodoTask task)
      : id = task.id,
        text = task.text,
        importance = switch (task.importance) {
          TaskPriority.low => "low",
          TaskPriority.important => "important",
          _ => "basic"
        },
        done = task.done,
        deadline = task.deadline?.millisecondsSinceEpoch,
        color = task.color.toString(),
        createdAt = task.createdAt.millisecondsSinceEpoch,
        changedAt = task.changedAt.millisecondsSinceEpoch,
        lastUpdatedBy = task.lastUpdatedBy;
}
