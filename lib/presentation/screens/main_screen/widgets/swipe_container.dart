import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/to_do_element.dart';

class SwipeableTodoContainer extends StatefulWidget {
  const SwipeableTodoContainer({
    super.key,
    required this.index,
  });

  final int index;
  @override
  State<SwipeableTodoContainer> createState() => _SwipeableTodoContainerState();
}

class _SwipeableTodoContainerState extends State<SwipeableTodoContainer> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onUpdate: (details) {
        setState(() {
          progress = details.progress;
        });
      },
      key: Key(context.read<TodoTasksBloc>().tasks[widget.index].id),
      background: Container(
        color: Colors.green,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width) * progress - 47 > 10
                    ? ((MediaQuery.of(context).size.width) * progress - 47)
                    : 10),
            child: Icon(
              Icons.favorite,
              size: 20 + progress * 37 < 35 ? 20 + progress * 37 : 30,
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
            child: Icon(
              Icons.delete,
              size: 20 + progress * 37 < 35 ? 20 + progress * 37 : 30,
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          ///
          context
              .read<TodoTasksBloc>()
              .add(TodoTasksChangeDoneEvent(index: widget.index));
          return false;
        } else {
          bool delete = true;
          final snackbarController = ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Удалено'),
              action: SnackBarAction(
                  label: 'Отмена', onPressed: () => delete = false),
            ),
          );
          await snackbarController.closed;
          return delete;
        }
      },
      onDismissed: (_) {
        ///
        context
            .read<TodoTasksBloc>()
            .add(TodoTasksRemoveEvent(index: widget.index));
      },
      child: ToDoElement(index: widget.index),
    );
  }
}
