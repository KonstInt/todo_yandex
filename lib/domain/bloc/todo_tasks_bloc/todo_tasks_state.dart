part of 'todo_tasks_bloc.dart';

@immutable
abstract class TodoTasksState {}

class TodoTasksInitial extends TodoTasksState {}

class TodoTasksListLoadedState extends TodoTasksState {
  final List<TodoTask> tasks;
  final int doneCounter;
  TodoTasksListLoadedState({required this.tasks, required this.doneCounter});
}

class TodoTaskLoadingState extends TodoTasksState {}

class TodoTaskNoInternetState extends TodoTasksState {}

class TodoTaskErrorState extends TodoTasksState {
  final String errorMessage;
  TodoTaskErrorState({required this.errorMessage});
}
