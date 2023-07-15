import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/firebase/firebase_config.dart';

class NavigationState {
  final bool? _unknown;
  final bool? _add;
  String? selectedTaskId;

  bool get isAdd => _add == true;

  bool get isDetailsScreen => selectedTaskId != null;

  bool get isRoot => !isAdd && !isDetailsScreen && !isUnknown;

  bool get isUnknown => _unknown == true;

  NavigationState.root()
      : _add = false,
        _unknown = false,
        selectedTaskId = null {
    GetIt.I<FirebaseAppConfig>().analytics.routeToMainScreen();
  }

  NavigationState.add()
      : _add = true,
        _unknown = false,
        selectedTaskId = null {
    GetIt.I<FirebaseAppConfig>().analytics.routeToAddTaskScreen();
  }

  NavigationState.item(this.selectedTaskId)
      : _add = false,
        _unknown = false {
    GetIt.I<FirebaseAppConfig>().analytics.routeToTaskDetailsScreen();
  }

  NavigationState.unknown()
      : _unknown = true,
        _add = false,
        selectedTaskId = null {
    GetIt.I<FirebaseAppConfig>().analytics.routeToUnknownScreen();
  }
}
