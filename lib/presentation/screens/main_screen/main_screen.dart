import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_yandex/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/domain/models/todo_task.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/add_task_line.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/swipe_container.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/to_do_element.dart';
import 'widgets/sliver_appbar_delegate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => TodoTasksBloc()..add(TodoTasksLoadEvent()),
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(),
                ),
                SliverToBoxAdapter(
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Column(
                      children: [
                        BlocBuilder<TodoTasksBloc, TodoTasksState>(
                          builder: (context, state) {
                            if (state is TodoTaskLoadedState) {
                              return ListView.builder(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: state.tasks.length,
                                itemBuilder: (context, index) {
                                  return Visibility(
                                      child: SwipeableTodoContainer(
                                    done: state.tasks[index].done,
                                    id: state.tasks[index].id,
                                    child: ToDoElement(
                                      task: state.tasks[index],
                                    ),
                                  ));
                                },
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        const AddTaskLine(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.background,
            ),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
