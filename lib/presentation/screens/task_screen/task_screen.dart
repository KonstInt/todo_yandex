import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, this.task});
  final TodoTask? task;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

const List<TaskPriority> list = <TaskPriority>[
  TaskPriority.basic,
  TaskPriority.low,
  TaskPriority.important
];

class _TaskScreenState extends State<TaskScreen> {
  late TextEditingController _controller;
  bool dateOn = false;
  TaskPriority? dropdownValue;
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    super.initState();

    _controller = TextEditingController();
    if (widget.task != null) {
      dateOn = widget.task!.deadline != null ? true : false;
      _controller.text = widget.task!.text;
      dateTime = widget.task!.deadline ?? DateTime.now();
      dropdownValue = widget.task!.importance;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.close)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (_controller.text.isNotEmpty) {
                            if (widget.task == null) {
                              context.read<TodoTasksBloc>().add(
                                    TodoTasksAddEvent(
                                      task: TodoTask(
                                          id: UniqueKey().toString(),
                                          text: _controller.text,
                                          importance: dropdownValue ??
                                              TaskPriority.basic,
                                          done: false,
                                          deadline: dateOn ? dateTime : null,
                                          createdAt: DateTime.now(),
                                          changedAt: DateTime.now(),
                                          lastUpdatedBy: "22222332332"),
                                    ),
                                  );
                            } else {
                              context.read<TodoTasksBloc>().add(
                                    TodoTasksChangeTaskEvent(
                                      id: widget.task!.id,
                                      task: TodoTask(
                                          id: widget.task!.id,
                                          text: _controller.text,
                                          importance: dropdownValue ??
                                              TaskPriority.basic,
                                          done: widget.task!.done,
                                          deadline: dateOn ? dateTime : null,
                                          createdAt: widget.task!.createdAt,
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
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  constraints: const BoxConstraints(minHeight: 144),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.onBackground,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context).colorScheme.shadow,
                        blurRadius: 1.0,
                        spreadRadius: 1,
                        offset: const Offset(0, 1.0),
                      ),
                    ],
                  ),
                  child: TextField(
                    cursorColor: Theme.of(context).primaryColor,
                    style: Theme.of(context).textTheme.bodyMedium,
                    controller: _controller,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: AppLocalizations.of(context)!.textExample,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Theme.of(context).colorScheme.shadow),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 6),
                  child: Text(AppLocalizations.of(context)!.priority),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 16.0, left: 16.0, top: 6, bottom: 10),
                  child: DropdownButton<TaskPriority>(
                    isDense: true,
                    value: dropdownValue,
                    elevation: 16,
                    style: Theme.of(context).textTheme.bodyMedium,
                    hint: Text(AppLocalizations.of(context)!.withoutPriority,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.shadow)),
                    onChanged: (TaskPriority? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    icon: SizedBox(),
                    iconSize: 0,
                    underline: SizedBox(),
                    items: list.map<DropdownMenuItem<TaskPriority>>(
                        (TaskPriority value) {
                      return DropdownMenuItem<TaskPriority>(
                        value: value,
                        child: switch (value) {
                          TaskPriority.basic => Text(
                              AppLocalizations.of(context)!.withoutPriority,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          TaskPriority.low => Text(
                              AppLocalizations.of(context)!.lowPriority,
                              style: Theme.of(context).textTheme.bodyMedium),
                          TaskPriority.important => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(MyAssets.kHighPriorityIcon),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.highPriority,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                        },
                      );
                    }).toList(),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.doneUntil,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          if (dateOn)
                            Text(DateFormat('dd.MM.yyyy').format(dateTime),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor))
                        ],
                      ),
                      Spacer(),
                      Switch(
                        activeColor: Theme.of(context).primaryColor,
                        value: dateOn,
                        onChanged: (bool value) async {
                          if (!value) {
                            setState(() {
                              dateOn = !dateOn;
                            });
                          } else {
                            final date = await pickDate();
                            if (date == null) return; // pressed 'CANCEL'
                            final newDateTime = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              dateTime.hour,
                              dateTime.minute,
                            ); // DateT
                            setState(
                              () {
                                dateOn = !dateOn;
                                dateTime = newDateTime;
                              },
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Divider(
                  thickness: 1,
                ),
                InkWell(
                  onTap: widget.task == null
                      ? null
                      : () {
                          context
                              .read<TodoTasksBloc>()
                              .add(TodoTasksRemoveEvent(id: widget.task!.id));
                          Navigator.of(context).pop();
                        },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 22),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          MyAssets.kRubbishIcon,
                          color: widget.task != null
                              ? MyColorsLight.kColorRed
                              : Theme.of(context).colorScheme.secondary,
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Text(
                          AppLocalizations.of(context)!.delete,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                color: widget.task != null
                                    ? MyColorsLight.kColorRed
                                    : Theme.of(context).colorScheme.secondary,
                              ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: dateTime,
      lastDate: DateTime(2250));
}
