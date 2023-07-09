import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:to_do_yandex/domain/exceptions/my_exceptions.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/todo_repository.dart';
part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  late final TodoRepository repository;

  List<TodoTask> _tasks = [];
  List<TodoTask> _resultList = [];
  int _doneCounter = 0;
  bool _isComplitedHide = false;
  var logger = Logger();
  bool get isComplitedHide => _isComplitedHide;

  TodoTask? getTaskById(String? id) {
    if (id == null) return null;
    try {
      TodoTask resTask = _tasks.firstWhere((element) => element.id == id);
      return resTask;
    } catch (e) {
      return null;
    }
  }

  TodoTasksBloc() : super(TodoTasksInitial()) {
    repository = TodoRepository();
    on<TodoTasksListLoadEvent>(_onTasksListLoadEvent);
    on<TodoTasksChangeDoneEvent>(_onTasksChangeDoneEvent);
    on<TodoTasksRemoveEvent>(_onTasksRemoveEvent);
    on<TodoTasksAddEvent>(_onTodoTasksAddEvent);
    on<TodoTasksChangeDoneVisibilityEvent>(
        _onTodoTasksChangeDoneVisibilityEvent);
    on<TodoTasksChangeTaskEvent>(_onTodoTasksChangeTaskEvent);
  }

  FutureOr<void> _onTasksListLoadEvent(
      TodoTasksListLoadEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(Level.verbose, "Start load task event");
    emit(TodoTaskLoadingState());
    List<TodoTask> tmpList = [];
    try {
      tmpList = await repository.getAndMergeTasks();
    } catch (e) {
      logger.e("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
    _tasks = tmpList;
    _filterFunction();
    logger.log(Level.verbose,
        "End load task event\nResultative list: ${_resultList.toString()}");
    logger.log(Level.verbose, jsonEncode("tasks: ${_tasks.toString()}"));
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
  }

  FutureOr<void> _onTasksChangeDoneEvent(
      TodoTasksChangeDoneEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(
        Level.verbose, "Start Change Done event for task with ${event.id} id");

    TodoTask changedTask =
        _tasks.firstWhere((element) => element.id == event.id);
    changedTask.done = !changedTask.done;

    emit(TodoTasksListLoadedState(
        tasks: _resultList,
        doneCounter: changedTask.done ? _doneCounter + 1 : _doneCounter));

    await Future<void>.delayed(const Duration(milliseconds: 850));
    emit(TodoTaskLoadingState());
    _filterFunction();
    logger.log(
        Level.verbose, "End Change Done event for task with ${event.id} id");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
    //int statusCode;

    try {
      await repository.editTask(changedTask);
    } catch (e) {
      logger.e("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
  }

  FutureOr<void> _onTasksRemoveEvent(
      TodoTasksRemoveEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(
        Level.verbose, "Start Remove event for task with ${event.id} id");
    emit(TodoTaskLoadingState());

    _tasks.removeWhere((element) => element.id == event.id);
    _filterFunction();
    logger.log(Level.verbose, "End Remove event for task with ${event.id} id");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
    try {
      await repository.removeTask(event.id);
    } catch (e) {
      logger.e("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
  }

  FutureOr<void> _onTodoTasksAddEvent(
      TodoTasksAddEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(Level.verbose, "Start Add task event with task  ${event.task}");
    emit(TodoTaskLoadingState());

    _tasks.add(event.task);
    _filterFunction();
    logger.log(Level.verbose, "End Add task event with task  ${event.task}");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
    try {
      await repository.addTask(event.task);
    } catch (e) {
      logger.e("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
  }

  FutureOr<void> _onTodoTasksChangeDoneVisibilityEvent(
      TodoTasksChangeDoneVisibilityEvent event, Emitter<TodoTasksState> emit) {
    logger.log(Level.verbose, "Start Change visibility event");
    emit(TodoTaskLoadingState());
    _isComplitedHide = !_isComplitedHide;
    _filterFunction();
    logger.log(Level.verbose, "End Change visibility event");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
  }

  FutureOr<void> _onTodoTasksChangeTaskEvent(
      TodoTasksChangeTaskEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(Level.verbose, "Start Change event with task  ${event.task}");
    emit(TodoTaskLoadingState());
    int i = _tasks.indexWhere((element) => element.id == event.id);

    _tasks[i] = event.task;
    _filterFunction();
    logger.log(Level.verbose, "End Change event with task  ${event.task}");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));

    try {
      await repository.editTask(event.task);
    } catch (e) {
      logger.e("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
  }

  void _filterFunction() {
    logger.log(Level.verbose, "Start filter");
    final List<TodoTask> doneTasks =
        _tasks.where((element) => element.done).toList();
    _doneCounter = doneTasks.length;
    _tasks.sort(((a, b) => b.createdAt.compareTo(a.createdAt)));
    _resultList = _tasks.where((element) => !element.done).toList() +
        (isComplitedHide ? [] : doneTasks);
    logger.log(Level.verbose, "Filter done");
  }
}
