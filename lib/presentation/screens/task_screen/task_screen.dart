import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_yandex/presentation/screens/task_screen/widgets/custom_appbar.dart';
import 'package:to_do_yandex/presentation/screens/task_screen/widgets/custom_task_screen_drop_menu.dart';
import 'package:to_do_yandex/presentation/screens/task_screen/widgets/delete_line.dart';
import '../../../domain/models/todo_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, this.task});
  final TodoTask? task;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}



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

  void callbackDDValue(TaskPriority value){setState(() {
                        dropdownValue = value;
                      });}
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
                CustomTaskScreenAppBar(controller: _controller, dateOn: dateOn, dateTime: dateTime, dropdownValue: dropdownValue, task: widget.task,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
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
                  child: 
                  CustomTaskScreenDropMenu(dropdownValue: dropdownValue, callbackValue: callbackDDValue)
                ),
                const Divider(
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
                      const Spacer(),
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
                const SizedBox(
                  height: 25,
                ),
                const Divider(
                  thickness: 1,
                ),
                DeleteLine(task: widget.task,)
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
