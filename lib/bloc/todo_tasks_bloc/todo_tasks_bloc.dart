import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../domain/models/todo_task.dart';
part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  List<TodoTask> tasks = todoTasks;
  List<TodoTask> resultList = [];
  int doneCounter = 0;
  bool isComplitedHide = false;
  var logger = Logger();

  TodoTasksBloc() : super(TodoTasksInitial()) {
    on<TodoTasksLoadEvent>(_onTasksLoadEvent);
    on<TodoTasksChangeDoneEvent>(_onTasksChangeDoneEvent);
    on<TodoTasksRemoveEvent>(_onTasksRemoveEvent);
    on<TodoTasksAddEvent>(_onTodoTasksAddEvent);
    on<TodoTasksChangeDoneVisibilityEvent>(
        _onTodoTasksChangeDoneVisibilityEvent);
    on<TodoTasksChangeTaskEvent>(_onTodoTasksChangeTaskEvent);
  }

  FutureOr<void> _onTasksLoadEvent(
      TodoTasksLoadEvent event, Emitter<TodoTasksState> emit) {
        logger.log(Level.verbose, "Start load task event");
    emit(TodoTaskLoadingState());
    _filterFunction();

    ///TODO: logic from database and server
    logger.log(Level.verbose, "End load task event\nResultative list: $resultList");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTasksChangeDoneEvent(
      TodoTasksChangeDoneEvent event, Emitter<TodoTasksState> emit) async {
    logger.log(
        Level.verbose, "Start Change Done event for task with ${event.id} id");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter + 1));
    tasks.firstWhere((element) => element.id == event.id).done =
        !tasks.firstWhere((element) => element.id == event.id).done;
    await Future<void>.delayed(Duration(milliseconds: 850));
    emit(TodoTaskLoadingState());
    _filterFunction();
    logger.log(Level.verbose, "End Change Done event for task with ${event.id} id");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTasksRemoveEvent(
      TodoTasksRemoveEvent event, Emitter<TodoTasksState> emit) {
    logger.log(
        Level.verbose, "Start Remove event for task with ${event.id} id");
    emit(TodoTaskLoadingState());
    tasks.removeWhere((element) => element.id == event.id);
    _filterFunction();
    logger.log(Level.verbose, "End Remove event for task with ${event.id} id");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
  }

  FutureOr<void> _onTodoTasksAddEvent(
      TodoTasksAddEvent event, Emitter<TodoTasksState> emit) {
    logger.log(Level.verbose, "Start Add task event with task  ${event.task}");
    emit(TodoTaskLoadingState());
    tasks.add(event.task);
    _filterFunction();
    logger.log(Level.verbose, "End Add task event with task  ${event.task}");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
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
      TodoTasksChangeTaskEvent event, Emitter<TodoTasksState> emit) {
        logger.log(Level.verbose, "Start Change event with task  ${event.task}");
    emit(TodoTaskLoadingState());
    int i = tasks.indexWhere((element) => element.id == event.id);
    tasks[i] = event.task;
    _filterFunction();
    logger.log(Level.verbose, "End Change event with task  ${event.task}");
    emit(TodoTaskLoadedState(tasks: resultList, doneCounter: doneCounter));
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

List<TodoTask> todoTasks = [
  TodoTask(
      id: UniqueKey().toString(),
      text: "Если что, вот мой тг для связи: @username_r00t 😉",
      importance: TaskPriority.important,
      done: true,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      deadline: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "Самая крупная жемчужина в мире достигает 6 килограммов в весе.",
      importance: TaskPriority.low,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "Законодательство США допускало отправку детей по почте до 1913 года.",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "В Ирландии никогда не было кротов.",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  TodoTask(
      id: UniqueKey().toString(),
      text: "Саудовская Аравия не содержит рек.",
      importance: TaskPriority.basic,
      done: true,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233",
      deadline: DateTime.now()),
    TodoTask(
      id: UniqueKey().toString(),
      text: "Я знаю что проверка это скучно, поэтому вот несколько интересных фактов",
      importance: TaskPriority.important,
      done: false,
      createdAt: DateTime.now(),
      changedAt: DateTime.now(),
      lastUpdatedBy: "232323233"),
  
];
