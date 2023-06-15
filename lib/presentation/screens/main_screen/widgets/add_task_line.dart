import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import '../../../../domain/models/todo_task.dart';

class AddTaskLine extends StatefulWidget {
  const AddTaskLine({super.key});

  @override
  State<AddTaskLine> createState() => _AddTaskLineState();
}

class _AddTaskLineState extends State<AddTaskLine> {
  late TextEditingController _controller;
  bool iconEnabled = false;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15),
      child: Row(
        children: [
          IconButton(
            disabledColor: Theme.of(context).colorScheme.shadow,
            onPressed: !iconEnabled
                ? null
                : () {
                    context.read<TodoTasksBloc>().add(
                          TodoTasksAddEvent(
                            task: TodoTask(
                                id: UniqueKey().toString(),
                                text: _controller.text,
                                importance: TaskPriority.basic,
                                done: false,
                                createdAt: DateTime.now(),
                                changedAt: DateTime.now(),
                                lastUpdatedBy: "22223332"),
                          ),
                        );
                    _controller.clear();
                    iconEnabled = false;
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: TextField(
              cursorColor: Theme.of(context).primaryColor,
              style: Theme.of(context).textTheme.bodyMedium,
              onChanged: (value) {
                setState(() {
                  iconEnabled = _controller.text.isEmpty ? false : true;
                });
              },
              controller: _controller,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppLocalizations.of(context)!.newTask,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.shadow),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
