import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';

part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  List<TodoTask> tasks = todoTasks;
  List<TodoTask> resultList = [];
  int doneCounter = 0;
  bool isComplitedHide = false;
  TodoTasksBloc() : super(TodoTasksInitial()) {
    on<TodoTasksLoadEvent>(_onTasksLoadEvent);
    on<TodoTasksChangeDoneEvent>(_onTasksChangeDoneEvent);
    on<TodoTasksRemoveEvent>(_onTasksRemoveEvent);
    on<TodoTasksAddEvent>(_onTodoTasksAddEvent);
    on<TodoTasksChangeDoneVisibilityEvent>(
        _onTodoTasksChangeDoneVisibilityEvent);
  }

  FutureOr<void> _onTasksLoadEvent(
      TodoTasksLoadEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    _filterFunction();

    ///TODO: logic from database and server
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTasksChangeDoneEvent(
      TodoTasksChangeDoneEvent event, Emitter<TodoTasksState> emit) async {
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter+1));
    tasks.firstWhere((element) => element.id == event.id).done =
        !tasks.firstWhere((element) => element.id == event.id).done;
    await Future<void>.delayed(Duration(milliseconds: 850));
    emit(TodoTaskLoadingState());
    _filterFunction();
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTasksRemoveEvent(
      TodoTasksRemoveEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    tasks.removeWhere((element) => element.id == event.id);
    _filterFunction();
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTodoTasksAddEvent(
      TodoTasksAddEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    tasks.add(event.task);
    _filterFunction();
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  void _filterFunction() {
    final List<TodoTask> doneTasks =
        tasks.where((element) => element.done).toList();
    doneCounter = doneTasks.length;
    tasks.sort(((a, b) => b.createdAt.compareTo(a.createdAt)));
    resultList = tasks.where((element) => !element.done).toList() +
        (isComplitedHide ? [] : doneTasks);
  }

  FutureOr<void> _onTodoTasksChangeDoneVisibilityEvent(
      TodoTasksChangeDoneVisibilityEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    isComplitedHide = !isComplitedHide;
    _filterFunction();
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }
}

List<TodoTask> todoTasks = [
  TodoTask(
      id: UniqueKey().toString(),
      text: "text",
      importance: TaskPriority.basic,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "text",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "text",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "text",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "text",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "text",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
];
