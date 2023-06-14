import 'package:flutter/material.dart';

class TodoTask {
  final String id;
  final String text;
  final TaskPriority importance;

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
}

enum TaskPriority { basic, important, low }
