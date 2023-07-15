import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/firebase/firebase_config.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_yandex/app/utils/constants.dart';

class TaskDetailsImportanceField extends StatelessWidget {
  const TaskDetailsImportanceField({
    required this.selectedImportance,
    required this.onImportanceValueChanged,
    super.key,
  });

  final TaskPriority? selectedImportance;
  final void Function(TaskPriority importance) onImportanceValueChanged;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return PopupMenuButton<TaskPriority>(
      initialValue: selectedImportance,
      itemBuilder: (context) => <PopupMenuEntry<TaskPriority>>[
        for (var importance in TaskPriority.values)
          PopupMenuItem<TaskPriority>(
            value: importance,
            child: PopupImportanceItem(importance: importance),
          ),
      ],
      onSelected: onImportanceValueChanged,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.priority,
            style: text.bodyMedium,
          ),
          const SizedBox(
            height: 8,
          ),
          ImportanceText(importance: selectedImportance)
        ],
      ),
    );
  }
}

class ImportanceText extends StatelessWidget {
  const ImportanceText({required this.importance, super.key});

  final TaskPriority? importance;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return switch (importance) {
      null => Text(
          AppLocalizations.of(context)!.withoutPriority,
          style: text.bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      TaskPriority.basic => Text(
          AppLocalizations.of(context)!.withoutPriority,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      TaskPriority.low => Text(AppLocalizations.of(context)!.lowPriority,
          style: Theme.of(context).textTheme.bodyMedium),
      TaskPriority.important => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              MyAssets.kHighPriorityIcon,
              colorFilter: ColorFilter.mode(
                  GetIt.I<FirebaseAppConfig>()
                      .configs
                      .getRemoteConfigImportantColor(),
                  BlendMode.srcIn),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              AppLocalizations.of(context)!.highPriority,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: GetIt.I<FirebaseAppConfig>()
                      .configs
                      .getRemoteConfigImportantColor()),
            ),
          ],
        ),
    };
  }
}

class PopupImportanceItem extends StatelessWidget {
  const PopupImportanceItem({required this.importance, super.key});

  final TaskPriority? importance;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return switch (importance) {
      null => Text(
          AppLocalizations.of(context)!.withoutPriority,
          style: text.bodyMedium,
        ),
      TaskPriority.basic => Text(
          AppLocalizations.of(context)!.withoutPriority,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      TaskPriority.low => Text(AppLocalizations.of(context)!.lowPriority,
          style: Theme.of(context).textTheme.bodyMedium),
      TaskPriority.important => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              MyAssets.kHighPriorityIcon,
              colorFilter: ColorFilter.mode(
                  GetIt.I<FirebaseAppConfig>()
                      .configs
                      .getRemoteConfigImportantColor(),
                  BlendMode.srcIn),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              AppLocalizations.of(context)!.highPriority,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: GetIt.I<FirebaseAppConfig>()
                      .configs
                      .getRemoteConfigImportantColor()),
            ),
          ],
        ),
    };
  }
}
