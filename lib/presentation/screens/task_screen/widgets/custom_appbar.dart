import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTaskScreenAppBar extends StatelessWidget {
  const CustomTaskScreenAppBar(
      {super.key,
      required this.controller,
      this.task,
      required this.dateOn,
      this.dropdownValue,
      required this.dateTime});
  final TextEditingController controller;
  final TodoTask? task;
  final bool dateOn;
  final TaskPriority? dropdownValue;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
      child: Row(
        children: [
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.close)),
          const Spacer(),
          InkWell(
            onTap: () {
              if (controller.text.isNotEmpty) {
                if (task == null) {
                  context.read<TodoTasksBloc>().add(
                        TodoTasksAddEvent(
                          task: TodoTask(
                              id: UniqueKey().hashCode.toString(),
                              text: controller.text,
                              importance: dropdownValue ?? TaskPriority.basic,
                              done: false,
                              color: null,
                              deadline: dateOn ? dateTime : null,
                              createdAt: DateTime.now(),
                              changedAt: DateTime.now(),
                              lastUpdatedBy: "22222332332"),
                        ),
                      );
                } else {
                  context.read<TodoTasksBloc>().add(
                        TodoTasksChangeTaskEvent(
                          id: task!.id,
                          task: TodoTask(
                              id: task!.id,
                              text: controller.text,
                              importance: dropdownValue ?? TaskPriority.basic,
                              done: task!.done,
                              deadline: dateOn ? dateTime : null,
                              createdAt: task!.createdAt,
                              changedAt: DateTime.now(),
                              lastUpdatedBy: "22222332332"),
                        ),
                      );
                }
                Navigator.of(context).pop();
              }
            },
            child: Text(
              AppLocalizations.of(context)!.save,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: MyColorsLight.kColorBlue),
            ),
          ),
        ],
      ),
    );
  }
}
