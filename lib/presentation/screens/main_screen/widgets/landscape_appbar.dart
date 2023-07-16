import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/app/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LandscapeAppbar extends StatelessWidget {
  const LandscapeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoTasksBloc, TodoTasksState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Виджет заголовка
            Center(
              child: Text(
                AppLocalizations.of(context)!.myTasks,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Виджет текста с количеством выполненных задач
                Text(
                  AppLocalizations.of(context)!.done +
                      (state is TodoTasksListLoadedState
                          ? state.doneCounter.toString()
                          : " "),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ),
                //Кнопка глаз
                IconButton(
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
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
