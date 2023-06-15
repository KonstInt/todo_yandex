import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/to_do_checkbox.dart';
import 'package:to_do_yandex/presentation/screens/task_screen/task_screen.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodoCheckbox(
              id: task.id,
              priority: task.importance,
              done: task.done,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 4),
                    child: Text(
                      task.text,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: task.done
                                ? Theme.of(context).colorScheme.secondary
                                : null,
                            decoration:
                                task.done ? TextDecoration.lineThrough : null,
                          ),
                    ),
                  ),
                  if (task.deadline != null)
                    Text(
                      DateFormat('dd.MM.yyyy').format(task.deadline!),
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary),
                    )
                ],
              ),
            ),
            SizedBox(
              width: 14,
            ),
            SizedBox(
              height: 19,
              child: IconButton(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  color: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => TaskScreen(
                                  task: task,
                                )),
                      ),
                  icon: SvgPicture.asset(MyAssets.kInfoOutlinedIcon)),
            ),
          ],
        ),
      ),
    );
  }
}
