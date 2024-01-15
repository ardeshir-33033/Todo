import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/core/base_routing/environment.dart';
import 'package:todo_list/features/todo/presentation/manager/todo_list_bloc.dart';
import 'package:todo_list/features/todo/presentation/pages/todo_list_page.dart';
import 'package:todo_list/l10n/l10n.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_list/locator.dart';

void main() async {
  await Environment.initEnvironment();

  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home: MultiBlocProvider(providers: [
        BlocProvider<TodoListBloc>(
          create: (context) =>
              locator<TodoListBloc>()..add(TodoListEventLoading()),
        ),
      ], child: const TodoListPage()),
    );
  }
}
