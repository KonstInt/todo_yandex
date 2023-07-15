import "package:isar/isar.dart";
import "package:to_do_yandex/utils/constants.dart";
part 'api_local_todo_task.g.dart';

@Collection()
class ApiLocalTodoTask {
  @Name("isar_id")
  Id get isarId => MyFunctions.fastHash(id!);
  String? id;
  String? text;
  @enumerated
  late ApiLocalTaskPriority importance;
  DateTime? deadline;
  bool? done;
  String? color;
  @Name("created_at")
  DateTime? createdAt;
  @Name("changed_at")
  DateTime? changedAt;
  @Name("last_updated_by")
  String? lastUpdatedBy;
}

enum ApiLocalTaskPriority { basic, important, low }
