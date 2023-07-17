import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/navigation/router_delegate.dart';
import 'package:to_do_yandex/app/utils/constants.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/widgets/landscape_appbar.dart';
import 'widgets/add_task_line.dart';
import 'widgets/swipe_container.dart';
import 'widgets/to_do_element.dart';
import 'widgets/sliver_appbar_delegate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    if (!MyFunctions.isPortraitOrientation(context) ||
        !MyFunctions.isTablet(context)) {
      return SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<TodoTasksBloc>().add(TodoTasksListLoadEvent());
              },
              child: CustomScrollView(
                //physics: BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(0),
                          child: Column(
                            children: [
                              BlocBuilder<TodoTasksBloc, TodoTasksState>(
                                builder: (context, state) {
                                  if (state is TodoTasksListLoadedState) {
                                    return ListView.builder(
                                      padding: const EdgeInsets.symmetric(
                                              vertical: 10)
                                          .h,
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
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
                                      child: Padding(
                                        padding: EdgeInsets.all(18.0),
                                        child: CircularProgressIndicator(),
                                      ),
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
          ),
          floatingActionButton: SizedBox(
            height: 65.r,
            width: 65.r,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  GetIt.I<MyRouterDelegate>().showAdd();
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Row(
              children: [
                const Expanded(flex: 1, child: LandscapeAppbar()),
                const VerticalDivider(
                  width: 1,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: double.infinity,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context
                            .read<TodoTasksBloc>()
                            .add(TodoTasksListLoadEvent());
                      },
                      child: Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 8.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Card(
                                elevation: 3,
                                margin: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    BlocBuilder<TodoTasksBloc, TodoTasksState>(
                                      builder: (context, state) {
                                        if (state is TodoTasksListLoadedState) {
                                          return ListView.builder(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
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
                                            child: Padding(
                                              padding: EdgeInsets.all(18.0),
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            height: 65,
            width: 65,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                  GetIt.I<MyRouterDelegate>().showAdd();
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
