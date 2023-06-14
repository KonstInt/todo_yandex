import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/utils/constants.dart';

class TodoCheckbox extends StatelessWidget {
  final int index;
  const TodoCheckbox({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    TodoTask task = context.read<TodoTasksBloc>().tasks[index];
    Color backgroundColor = switch (task.importance) {
      TaskPriority.important => MyColorsLight.kColorRed.withOpacity(0.16),
      _ => Colors.transparent
    };
    Color borderColor = switch (task.importance) {
      TaskPriority.important => MyColorsLight.kColorRed,
      _ => MyColorsLight.kSeparatorColor.withOpacity(0.2)
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              color: task.done
                  ? MyColorsLight.kColorGreen
                  : backgroundColor,
              width: 15,
              height: 15,
            ),
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              checkColor: Theme.of(context).colorScheme.onBackground,
              overlayColor:
                  MaterialStateProperty.all(MyColorsLight.kColorGrayLight),
              fillColor: MaterialStateProperty.all(
                  task.done ? Colors.green : borderColor),
              value: task.done,
              onChanged: (bool? newValue) {
                context
                    .read<TodoTasksBloc>()
                    .add(TodoTasksChangeDoneEvent(index: index));
              },
            ),
          ],
        ),
        Icon(Icons.abc_outlined),
      ],
    );
  }
}
