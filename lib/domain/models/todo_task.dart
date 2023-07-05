// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TodoTask {
  final String id;
  String text;
  TaskPriority importance;

  DateTime? deadline;
  bool done;
  bool isSynchronized;
  Color? color;

  DateTime createdAt;
  DateTime changedAt;
  String lastUpdatedBy;

  TodoTask(
      {required this.id,
      required this.text,
      required this.importance,
      required this.done,
      required this.isSynchronized,
      this.deadline,
      this.color,
      required this.createdAt,
      required this.changedAt,
      required this.lastUpdatedBy});

  @override
  String toString() {
    return 'TodoTask(id: $id, text: $text, importance: $importance, deadline: $deadline, done: $done, isSynchronized: $isSynchronized, color: $color, createdAt: $createdAt, changedAt: $changedAt, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  bool operator ==(covariant TodoTask other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.text == text &&
        other.importance == importance &&
        other.deadline == deadline &&
        other.done == done &&
        other.isSynchronized == isSynchronized &&
        other.color == color &&
        other.createdAt == createdAt &&
        other.changedAt == changedAt &&
        other.lastUpdatedBy == lastUpdatedBy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        importance.hashCode ^
        deadline.hashCode ^
        done.hashCode ^
        isSynchronized.hashCode ^
        color.hashCode ^
        createdAt.hashCode ^
        changedAt.hashCode ^
        lastUpdatedBy.hashCode;
  }
}

enum TaskPriority { basic, important, low }
