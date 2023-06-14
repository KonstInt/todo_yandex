import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';

part 'todo_tasks_event.dart';
part 'todo_tasks_state.dart';

class TodoTasksBloc extends Bloc<TodoTasksEvent, TodoTasksState> {
  List<TodoTask> tasks = [
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.basic, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),
    TodoTask(id: UniqueKey().toString(), text: "text", importance: TaskPriority.important, done: false, createdAt: DateTime.now(), changedAt: DateTime.now(), lastUpdatedBy: "232323233"),

  ];
  TodoTasksBloc() : super(TodoTasksInitial()) {
    on<TodoTasksLoadEvent>(_onTasksLoadEvent);
    on<TodoTasksChangeDoneEvent>(_onTasksChangeDoneEvent);
    on<TodoTasksRemoveEvent>(_onTasksRemoveEvent);
    on<TodoTasksAddEvent>(_onTodoTasksAddEvent); 
  }

  FutureOr<void> _onTasksLoadEvent(TodoTasksLoadEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    ///TODO: logic
    emit(TodoTaskLoadedState(tasks: tasks));
  }

  FutureOr<void> _onTasksChangeDoneEvent(TodoTasksChangeDoneEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    tasks[event.index].done = !tasks[event.index].done;
    emit(TodoTaskLoadedState(tasks: tasks));
  }

  FutureOr<void> _onTasksRemoveEvent(TodoTasksRemoveEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    tasks.removeAt(event.index);
    emit(TodoTaskLoadedState(tasks: tasks));
  }

  FutureOr<void> _onTodoTasksAddEvent(TodoTasksAddEvent event, Emitter<TodoTasksState> emit) {
    emit(TodoTaskLoadingState());
    tasks.add(event.task);
    emit(TodoTaskLoadedState(tasks: tasks));
  }
}
