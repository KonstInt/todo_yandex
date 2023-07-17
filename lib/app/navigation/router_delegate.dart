import 'package:flutter/material.dart';
import 'package:to_do_yandex/presentation/screens/main_screen/main_screen.dart';
import 'package:to_do_yandex/presentation/screens/task_screen/task_screen.dart';

import 'navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  NavigationState? state;

  @override
  NavigationState get currentConfiguration {
    return state ?? NavigationState.root();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(
          child: MainScreen(),
        ),
        if (state?.isDetailsScreen == true)
          MaterialPage(
            child: TaskScreen(taskId: state?.selectedTaskId),
          ),
        if (state?.isAdd == true)
          const MaterialPage(
            child: TaskScreen(),
          ),
        /*if (state?.isUnknown == true)
          const MaterialPage(
            child: UnknownScreen(),
          ),*/
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        state = NavigationState.root();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    state = configuration;
    notifyListeners();
  }

  void showItemDetails(String itemId) {
    state = NavigationState.item(itemId);
    notifyListeners();
  }

  void showAdd() {
    state = NavigationState.add();
    notifyListeners();
  }
}
