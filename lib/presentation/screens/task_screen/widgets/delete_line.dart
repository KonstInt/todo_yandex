import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/app/utils/constants.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20.0.r, vertical: 22.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              MyAssets.kRubbishIcon,
              colorFilter: ColorFilter.mode(
                  task != null
                      ? CommonColors.kColorRed
                      : Theme.of(context).colorScheme.secondary,
                  BlendMode.srcIn),
              height: 20.sp,
              width: 20.sp,
            ),
            const SizedBox(
              width: 14,
            ),
            Text(
              AppLocalizations.of(context)!.delete,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: task != null
                        ? CommonColors.kColorRed
                        : Theme.of(context).colorScheme.secondary,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
