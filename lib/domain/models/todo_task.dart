import 'package:flutter/material.dart';

class TodoTask {

  final String id;
  String text;
  TaskPriority importance;

  DateTime? deadline;
  bool done;

  Color? color;

  DateTime createdAt;
  DateTime changedAt;
  String lastUpdatedBy;

  TodoTask(
      {required this.id,
      required this.text,
      required this.importance,
      required this.done,
      this.deadline,
      this.color,
      required this.createdAt,
      required this.changedAt,
      required this.lastUpdatedBy});

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "importance": importance.name,
        "deadline": deadline?.toIso8601String(),
        "done": done,
        "color": color.toString(),
        "created_at": changedAt.toIso8601String(),
        "changed_at": changedAt.toIso8601String(),
        "last_updated_by": lastUpdatedBy
      };
}

enum TaskPriority { basic, important, low }
