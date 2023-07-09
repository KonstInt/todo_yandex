import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:to_do_yandex/app/navigation/router_delegate.dart';
import '../../../../domain/models/todo_task.dart';
import 'to_do_checkbox.dart';
import '../../../../utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: kIsWeb
                        ? const EdgeInsets.only(top: 5.0, bottom: 4)
                        : const EdgeInsets.only(top: 10.0, bottom: 4),
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
                      DateFormat('dd MMMM yyyy',
                              AppLocalizations.of(context)?.localeName)
                          .format(task.deadline!),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    )
                ],
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: SizedBox(
                height: 19,
                child: IconButton(
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(0),
                    onPressed: () =>
                        GetIt.I<MyRouterDelegate>().showItemDetails(task.id),
                    icon: SvgPicture.asset(MyAssets.kInfoOutlinedIcon)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
