import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_yandex/utils/constants.dart';

class CustomTaskScreenDropMenu extends StatelessWidget {
  const CustomTaskScreenDropMenu(
      {super.key, required this.dropdownValue, required this.callbackValue});
  final TaskPriority? dropdownValue;
  final Function callbackValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<TaskPriority>(
      isDense: true,
      value: dropdownValue,
      elevation: 16,
      style: Theme.of(context).textTheme.bodyMedium,
      hint: Text(AppLocalizations.of(context)!.withoutPriority,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.shadow)),
      onChanged: (TaskPriority? value) {
        callbackValue(value);
      },
      icon: const SizedBox(),
      iconSize: 0,
      underline: const SizedBox(),
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
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      AppLocalizations.of(context)!.highPriority,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: MyColorsLight.kColorRed),
                    ),
                  ],
                ),
            },
          );
        },
      ).toList(),
    );
  }
}

const List<TaskPriority> list = <TaskPriority>[
  TaskPriority.basic,
  TaskPriority.low,
  TaskPriority.important
];
