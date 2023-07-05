import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../domain/models/todo_task.dart';

class DeleteLine extends StatelessWidget {
  const DeleteLine({super.key, this.task});
  final TodoTask? task;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: task == null
          ? null
          : () {
              context
                  .read<TodoTasksBloc>()
                  .add(TodoTasksRemoveEvent(id: task!.id));
              Navigator.of(context).pop();
            },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
        child: Row(
          children: [
            SvgPicture.asset(
              MyAssets.kRubbishIcon,
              colorFilter: ColorFilter.mode( task != null
                      ? MyColorsLight.kColorRed
                      : Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
             
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              AppLocalizations.of(context)!.delete,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: task != null
                        ? MyColorsLight.kColorRed
                        : Theme.of(context).colorScheme.secondary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
