import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'widgets/add_task_line.dart';
import 'widgets/swipe_container.dart';
import 'widgets/to_do_element.dart';
import '../task_screen/task_screen.dart';
import 'widgets/sliver_appbar_delegate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                child: Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      elevation: 3,
                      margin:const EdgeInsets.all(0),
                      child: Column(
                        children: [
                          BlocBuilder<TodoTasksBloc, TodoTasksState>(
                            builder: (context, state) {
                              if (state is TodoTaskLoadedState) {
                                return ListView.builder(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.tasks.length,
                                  itemBuilder: (context, index) {
                                    return SwipeableTodoContainer(
                                      done: state.tasks[index].done,
                                      id: state.tasks[index].id,
                                      child: ToDoElement(
                                    task: state.tasks[index],
                                      ),
                                    );
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
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TaskScreen()),
            );
          },
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }
}
