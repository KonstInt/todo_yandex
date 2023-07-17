import 'package:flutter/material.dart';
import 'package:to_do_yandex/app/navigation/navigation_state.dart';

import 'routes_constants.dart';

class CustomRouteInformationParser
    extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation) async {
    final location = routeInformation.location;
    if (location == null) {
      return NavigationState.unknown();
    }

    final uri = Uri.parse(location);
    if (uri.pathSegments.isEmpty) {
      return NavigationState.root();
    }

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == AppRoutes.taskAddRoute) {
        return NavigationState.add();
      }

      return NavigationState.root();
    }

    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == AppRoutes.taskDetailsRoute) {
        final taskId = uri.pathSegments[1];
        return NavigationState.item(taskId);
      }

      return NavigationState.unknown();
    }
    return NavigationState.root();
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration.isAdd) {
      return const RouteInformation(location: '/${AppRoutes.taskAddRoute}');
    }

    if (configuration.isDetailsScreen) {
      return RouteInformation(
          location:
              '/${AppRoutes.taskDetailsRoute}/${configuration.selectedTaskId}');
    }

    if (configuration.isUnknown) {
      return null;
    }

    return const RouteInformation(location: '/${AppRoutes.homeRoute}');
  }
}
