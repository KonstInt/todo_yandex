import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';

//Кастомный AppBar с плавным передвижением текста и иконки как в дизайне
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;
    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed)
        .clamp(0, 1)
        .toDouble();
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final double animationVal = scrollAnimationValue(shrinkOffset);
    return Container(
      height: visibleMainHeight,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          //Анимированная появляющаяся тень
          BoxShadow(
            color: Theme.of(context)
                .colorScheme
                .shadow
                .withOpacity(1 - animationVal),
            blurRadius: 3.0,
            spreadRadius: 4.0,
          ),
        ],
      ),
      child: BlocBuilder<TodoTasksBloc, TodoTasksState>(
        builder: (context, state) {
          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //Виджет текста с количеством выполненных задач
              Positioned(
                bottom: animationVal * 18,
                left: 60,
                child: Opacity(
                  opacity: animationVal,
                  child: Text(
                    AppLocalizations.of(context)!.done + (state is TodoTaskLoadedState ? state.doneCounter.toString() : " " ),
                  ),
                ),
              ),
              //Виджет заголовка
              Positioned(
                bottom: 16.0 + animationVal * 24,
                left: (animationVal * 44 + 16).toDouble(),
                child: Text(
                  AppLocalizations.of(context)!.myTasks,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: animationVal * 12 + 20),
                ),
              ),
              //Кнопка глаз
              Positioned(
                bottom: 16 + animationVal * 2,
                right: 25,
                child: IconButton(
                  onPressed: () => context
                      .read<TodoTasksBloc>()
                      .add(TodoTasksChangeDoneVisibilityEvent()),
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //Максимальная высота
  @override
  double get maxExtent => 150.0;
  //Минимальная высота
  @override
  double get minExtent => 65.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
