import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/to_do_checkbox.dart';
import 'package:to_do_yandex/utils/constants.dart';

class ToDoElement extends StatelessWidget {
  const ToDoElement({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.onBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TodoCheckbox(index: index),
            Expanded(
              flex: 2,
              child: Text(
                context.read<TodoTasksBloc>().tasks[index].text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Icon(context.read<TodoTasksBloc>().tasks[index].done
                ? Icons.favorite
                : Icons.favorite_border),
          ]),
        ),
      );
  }
}
