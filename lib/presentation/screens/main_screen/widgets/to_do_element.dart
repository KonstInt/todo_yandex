import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/to_do_checkbox.dart';
import 'package:to_do_yandex/utils/constants.dart';

class ToDoElement extends StatelessWidget {
  const ToDoElement({
    super.key,
    required this.task,
  });
  final TodoTask task;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.onBackground,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            TodoCheckbox(id: task.id, priority: task.importance, done: task.done,),
            Expanded(
              flex: 2,
              child: Text(
                task.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Icon(task.done
                ? Icons.favorite
                : Icons.favorite_border),
          ]),
        ),
      );
  }
}
