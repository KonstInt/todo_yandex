import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/todo_repository.dart';
part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  late final TodoRepository repository;

  List<TodoTask> tasks = [];
  List<TodoTask> resultList = [];
  int doneCounter = 0;
  bool isComplitedHide = false;
  var logger = Logger();

  TodoTasksBloc() : super(TodoTasksInitial()) {
    repository = TodoRepository();
    on<TodoTasksLoadEvent>(_onTasksLoadEvent);
    on<TodoTasksChangeDoneEvent>(_onTasksChangeDoneEvent);
    on<TodoTasksRemoveEvent>(_onTasksRemoveEvent);
    on<TodoTasksAddEvent>(_onTodoTasksAddEvent);
    on<TodoTasksChangeDoneVisibilityEvent>(
        _onTodoTasksChangeDoneVisibilityEvent);
    on<TodoTasksChangeTaskEvent>(_onTodoTasksChangeTaskEvent);
  }

  FutureOr<void> _onTasksLoadEvent(
      TodoTasksLoadEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(Level.verbose, "Start load task event");
    emit(TodoTaskLoadingState());
    int statusCode;
    List<TodoTask> tmpList;
    (statusCode, tmpList) = await repository.getAndMergeTasks();
    tasks = tmpList;
    _filterFunction();
    logger.log(Level.verbose,
        "End load task event with $statusCode code\nResultative list: $resultList");
    logger.log(Level.verbose, jsonEncode("tasks: $tasks"));
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTasksChangeDoneEvent(
      TodoTasksChangeDoneEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(
        Level.verbose, "Start Change Done event for task with ${event.id} id");

    TodoTask changedTask =
        tasks.firstWhere((element) => element.id == event.id);
    changedTask.done = !changedTask.done;

    emit(TodoTaskLoadedState(
        tasks: resultList,
        doneCounter: changedTask.done ? doneCounter + 1 : doneCounter));

    await Future<void>.delayed(const Duration(milliseconds: 850));
    emit(TodoTaskLoadingState());
    _filterFunction();
    logger.log(
        Level.verbose, "End Change Done event for task with ${event.id} id");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
    //int statusCode;
    List<TodoTask>? tmpList;
    (_, tmpList) = await repository.changeTask(changedTask);
    if (tmpList != null) {
      tasks = tmpList;
      _filterFunction();
      emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
    }
  }

  FutureOr<void> _onTasksRemoveEvent(
      TodoTasksRemoveEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(
        Level.verbose, "Start Remove event for task with ${event.id} id");
    emit(TodoTaskLoadingState());

    tasks.removeWhere((element) => element.id == event.id);
    _filterFunction();
    logger.log(Level.verbose, "End Remove event for task with ${event.id} id");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
    //int statusCode;
    List<TodoTask>? tmpList;
    (_, tmpList) = await repository.taskRemove(event.id);
    if (tmpList != null) {
      tasks = tmpList;
      _filterFunction();
      emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
    }
  }

  FutureOr<void> _onTodoTasksAddEvent(
      TodoTasksAddEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(Level.verbose, "Start Add task event with task  ${event.task}");
    emit(TodoTaskLoadingState());

    tasks.add(event.task);
    _filterFunction();
    logger.log(Level.verbose, "End Add task event with task  ${event.task}");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
    repository.taskAdd(event.task);
  }

  FutureOr<void> _onTodoTasksChangeDoneVisibilityEvent(
      TodoTasksChangeDoneVisibilityEvent event, Emitter<TodoTasksState> emit) {
    logger.log(Level.verbose, "Start Change visibility event");
    emit(TodoTaskLoadingState());
    isComplitedHide = !isComplitedHide;
    _filterFunction();
    logger.log(Level.verbose, "End Change visibility event");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTodoTasksChangeTaskEvent(
      TodoTasksChangeTaskEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(Level.verbose, "Start Change event with task  ${event.task}");
    emit(TodoTaskLoadingState());
    int i = tasks.indexWhere((element) => element.id == event.id);

    tasks[i] = event.task;
    _filterFunction();
    logger.log(Level.verbose, "End Change event with task  ${event.task}");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));

    //int statusCode;
    List<TodoTask>? tmpList;
    (_, tmpList) = await repository.changeTask(event.task);
    if (tmpList != null) {
      tasks = tmpList;
      _filterFunction();
      emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
    }
  }

  void _filterFunction() {
    logger.log(Level.verbose, "Start filter");
    final List<TodoTask> doneTasks =
        tasks.where((element) => element.done).toList();
    doneCounter = doneTasks.length;
    tasks.sort(((a, b) => b.createdAt.compareTo(a.createdAt)));
    resultList = tasks.where((element) => !element.done).toList() +
        (isComplitedHide ? [] : doneTasks);
    logger.log(Level.verbose, "Filter done");
  }
}
