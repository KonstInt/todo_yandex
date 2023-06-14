part of 'todo_tasks_bloc.dart';

@immutable
abstract class TodoTasksEvent {}

class TodoTasksLoadEvent extends TodoTasksEvent {}

class TodoTasksChangeDoneEvent extends TodoTasksEvent {
  final int index;
  TodoTasksChangeDoneEvent({required this.index});
}

class TodoTasksAddEvent extends TodoTasksEvent {
  final TodoTask task;
  TodoTasksAddEvent({required this.task});
}
class TodoTasksRemoveEvent extends TodoTasksEvent {
  final int index;
  TodoTasksRemoveEvent({required this.index});
}
