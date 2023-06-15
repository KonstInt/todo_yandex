part of 'todo_tasks_bloc.dart';

@immutable
abstract class TodoTasksEvent {}

class TodoTasksLoadEvent extends TodoTasksEvent {}

class TodoTasksChangeDoneEvent extends TodoTasksEvent {
  final String id;
  TodoTasksChangeDoneEvent({required this.id});
}

class TodoTasksChangeDoneVisibilityEvent extends TodoTasksEvent{}
class TodoTasksAddEvent extends TodoTasksEvent {
  final TodoTask task;
  TodoTasksAddEvent({required this.task});
}
class TodoTasksRemoveEvent extends TodoTasksEvent {
  final String id;
  TodoTasksRemoveEvent({required this.id});
}
