import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import '../../../../app/utils/constants.dart';

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
                left: 60.r,
                child: Opacity(
                  opacity: animationVal,
                  child: Text(
                    AppLocalizations.of(context)!.done +
                        (state is TodoTasksListLoadedState
                            ? state.doneCounter.toString()
                            : " "),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ),
              //Виджет заголовка
              Positioned(
                bottom: 16.0 + animationVal * 24.r,
                left: (animationVal * 44 + 16).toDouble().r,
                child: Text(
                  AppLocalizations.of(context)!.myTasks,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: (animationVal * 12 + 20).sp),
                ),
              ),
              //Кнопка глаз
              Positioned(
                bottom: 5.r + animationVal * 2.r,
                right: 25.r,
                child: IconButton(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(0),
                  onPressed: () => context
                      .read<TodoTasksBloc>()
                      .add(TodoTasksChangeDoneVisibilityEvent()),
                  icon: SvgPicture.asset(
                    context.read<TodoTasksBloc>().isComplitedHide
                        ? MyAssets.kEyeIcon
                        : MyAssets.kEyeCrossIcon,
                    height: 20.r,
                    width: 20.r,
                  ),
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
