import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/firebase/firebase_config.dart';
import 'package:to_do_yandex/domain/exceptions/my_exceptions.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/domain/repository/todo_repository.dart';
import '../../../app/logger.dart';
part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  late final TodoRepository repository;

  List<TodoTask> _tasks = [];
  List<TodoTask> _resultList = [];
  int _doneCounter = 0;
  bool _isComplitedHide = false;
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
    logger.d("Start task loading event");
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
    logger.d(
        "End load task event\nResultative list length: ${_resultList.length.toString()}");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
  }

  FutureOr<void> _onTasksChangeDoneEvent(
      TodoTasksChangeDoneEvent event, Emitter<TodoTasksState> emit) async {
    logger.d("Start change_done event for task with ${event.id} id");
    GetIt.I<FirebaseAppConfig>().analytics.analyticDoneEvent();
    //TODO: Think about optimization
    int changedTaskId =
        _tasks.lastIndexWhere((element) => element.id == event.id);
    int changedTaskFilteredId =
        _resultList.lastIndexWhere((element) => element.id == event.id);
    _tasks[changedTaskId] =
        _tasks[changedTaskId].copyWith(done: !_tasks[changedTaskId].done);
    _resultList[changedTaskFilteredId] = _tasks[changedTaskId];
    emit(TodoTasksListLoadedState(
        tasks: _resultList,
        doneCounter:
            _tasks[changedTaskId].done ? _doneCounter + 1 : _doneCounter));

    await Future<void>.delayed(const Duration(milliseconds: 450));
    emit(TodoTaskLoadingState());
    _filterFunction();
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
    //int statusCode;

    try {
      await repository.editTask(_tasks[changedTaskId]);
    } catch (e) {
      logger.d("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
    logger.d("End change_done event for task with ${event.id} id");
  }

  FutureOr<void> _onTasksRemoveEvent(
      TodoTasksRemoveEvent event, Emitter<TodoTasksState> emit) async {
    logger.d("Start remove_event for task with ${event.id} id");
    GetIt.I<FirebaseAppConfig>().analytics.analyticDeleteEvent();
    emit(TodoTaskLoadingState());

    _tasks.removeWhere((element) => element.id == event.id);
    _filterFunction();
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
    try {
      await repository.removeTask(event.id);
    } catch (e) {
      logger.d("Error: ${e.toString()}");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
    logger.d("End remove_event for task with ${event.id} id");
  }

  FutureOr<void> _onTodoTasksAddEvent(
      TodoTasksAddEvent event, Emitter<TodoTasksState> emit) async {
    logger.d("Start add_task event with task  ${event.task}");
    GetIt.I<FirebaseAppConfig>().analytics.addTaskEvent();
    emit(TodoTaskLoadingState());

    _tasks.add(event.task);
    _filterFunction();
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
    logger.d("End add_task event with task  ${event.task.toString()}");
  }

  FutureOr<void> _onTodoTasksChangeDoneVisibilityEvent(
      TodoTasksChangeDoneVisibilityEvent event, Emitter<TodoTasksState> emit) {
    logger.d("Start change_visibility event to ${!isComplitedHide}");
    emit(TodoTaskLoadingState());
    _isComplitedHide = !_isComplitedHide;
    _filterFunction();
    logger.d("End change_visibility event");
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));
  }

  FutureOr<void> _onTodoTasksChangeTaskEvent(
      TodoTasksChangeTaskEvent event, Emitter<TodoTasksState> emit) async {
    logger.d("Start change_event with task id ${event.task.id}");
    emit(TodoTaskLoadingState());
    int i = _tasks.indexWhere((element) => element.id == event.id);

    _tasks[i] = event.task;
    _filterFunction();
    emit(TodoTasksListLoadedState(
        tasks: _resultList, doneCounter: _doneCounter));

    try {
      await repository.editTask(event.task);
    } catch (e) {
      logger.d("Error: $e");
      emit(
          TodoTaskErrorState(errorMessage: (e as MyExceptions).errorMessage()));
      emit(TodoTasksListLoadedState(
          tasks: _resultList, doneCounter: _doneCounter));
    }
    logger.d("End change_event with task id ${event.task.id}");
  }

  void _filterFunction() {
    logger.d("Start filter");
    final List<TodoTask> doneTasks =
        _tasks.where((element) => element.done).toList();
    _doneCounter = doneTasks.length;
    _tasks.sort(((a, b) => b.createdAt.compareTo(a.createdAt)));
    _resultList = _tasks.where((element) => !element.done).toList() +
        (isComplitedHide ? [] : doneTasks);
    logger.d("Filter done");
  }
}
