import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_yandex/app/navigation/route_information_parser.dart';
import 'package:to_do_yandex/app/navigation/router_delegate.dart';
import 'package:to_do_yandex/domain/bloc/todo_tasks_bloc/todo_tasks_bloc.dart';
import 'package:to_do_yandex/utils/light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoTasksBloc()..add(TodoTasksListLoadEvent()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'to_do',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        theme: lightThemeData(),
        routerDelegate: GetIt.I<MyRouterDelegate>(),
        routeInformationParser: GetIt.I<CustomRouteInformationParser>(),
        // home: const MainScreen(),
      ),
    );
  }
}
