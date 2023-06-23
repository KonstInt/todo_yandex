import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import '../../../../utils/constants.dart';

class SwipeableTodoContainer extends StatefulWidget {
  const SwipeableTodoContainer({
    super.key,
    required this.id,
    required this.child,
    required this.done,
  });
  final Widget child;
  final String id;
  final bool done;
  @override
  State<SwipeableTodoContainer> createState() => _SwipeableTodoContainerState();
}

class _SwipeableTodoContainerState extends State<SwipeableTodoContainer> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      movementDuration: const Duration(milliseconds: 80),
      //resizeDuration: Duration(seconds: 10),
      onUpdate: (details) {
        setState(() {
          progress = details.progress;
        });
      },
      key: Key(widget.id),
      background: Container(
        color: !widget.done
            ? Colors.green
            : Colors.yellow.withOpacity(1 - progress),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width) * progress - 47 > 10
                    ? ((MediaQuery.of(context).size.width) * progress - 47)
                    : 10),
            child: SvgPicture.asset(
              widget.done ? MyAssets.kDoneIcon : MyAssets.kDoneIcon,
              width: 15 + progress * 25 < 25 ? 15 + progress * 37 : 20,
              height: 15 + progress * 25 < 25 ? 15 + progress * 37 : 20,
            ),
          ),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(
                right: (MediaQuery.of(context).size.width) * progress - 47 > 10
                    ? ((MediaQuery.of(context).size.width) * progress - 47)
                    : 10),
            child: SvgPicture.asset(
              MyAssets.kRubbishIcon,
              width: 15 + progress * 25 < 25 ? 15 + progress * 37 : 20,
              height: 15 + progress * 25 < 25 ? 15 + progress * 37 : 20,
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          ///
          context
              .read<TodoTasksBloc>()
              .add(TodoTasksChangeDoneEvent(id: widget.id));
          return false;
        } else {
          bool delete = true;
          final snackbarController = ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 1),
              content: Text(AppLocalizations.of(context)!.deleted),
              action: SnackBarAction(
                  label: AppLocalizations.of(context)!.cancel,
                  onPressed: () => delete = false),
            ),
          );
          await snackbarController.closed;
          return delete;
        }
      },
      onDismissed: (_) {
        ///
        context.read<TodoTasksBloc>().add(TodoTasksRemoveEvent(id: widget.id));
      },
      child: widget.child,
    );
  }
}
