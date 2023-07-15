import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/firebase/firebase_config.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import '../../../../domain/models/todo_task.dart';
import '../../../../app/utils/constants.dart';

class TodoCheckbox extends StatefulWidget {
  final String id;
  final TaskPriority priority;
  final bool done;
  const TodoCheckbox(
      {super.key,
      required this.id,
      required this.priority,
      required this.done});

  @override
  State<TodoCheckbox> createState() => _TodoCheckboxState();
}

class _TodoCheckboxState extends State<TodoCheckbox> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = switch (widget.priority) {
      TaskPriority.important => GetIt.I<FirebaseAppConfig>()
          .configs
          .getRemoteConfigImportantColor()
          .withOpacity(0.16),
      _ => Colors.transparent
    };
    Color borderColor = switch (widget.priority) {
      TaskPriority.important =>
        GetIt.I<FirebaseAppConfig>().configs.getRemoteConfigImportantColor(),
      _ => Theme.of(context).colorScheme.secondary.withOpacity(0.4)
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: widget.done ? CommonColors.kColorGreen : backgroundColor,
              width: 15,
              height: 15,
            ),
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              checkColor: Theme.of(context).colorScheme.onBackground,
              fillColor: MaterialStateProperty.all(
                  widget.done ? Colors.green : borderColor),
              value: widget.done,
              onChanged: (bool? newValue) async {
                context
                    .read<TodoTasksBloc>()
                    .add(TodoTasksChangeDoneEvent(id: widget.id));
              },
            ),
          ],
        ),
        if (!widget.done)
          switch (widget.priority) {
            TaskPriority.low => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: SvgPicture.asset(MyAssets.kLowPriorityIcon)),
            TaskPriority.important => Padding(
                padding: const EdgeInsets.only(right: 6),
                child: SvgPicture.asset(
                  MyAssets.kHighPriorityIcon,
                  colorFilter: ColorFilter.mode(
                      GetIt.I<FirebaseAppConfig>()
                          .configs
                          .getRemoteConfigImportantColor(),
                      BlendMode.srcIn),
                ),
              ),
            _ => const SizedBox()
          },
      ],
    );
  }
}
