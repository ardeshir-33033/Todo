import 'package:flutter/material.dart';
import 'package:todo_list/core/api_handler/api_handler.dart';
import 'package:todo_list/core/extenstions/translate_extensions.dart';
import 'package:todo_list/features/todo/data/data_sources/todo_list_data_source.dart';
import 'package:todo_list/features/todo/presentation/widgets/linear_calendar.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  ApiHandler api = ApiHandlerImpl();
  @override
  void initState() {
    var res = TodoListDataSourceImpl(api).getTodoItems();
    print(res);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(tr(context).schedule),
      ),
      body: const Column(
        children: [
          Divider(),
          SizedBox(height: 100, child: LinearCalendar()),
          Divider(),
          // Expanded(child: Container())
        ],
      ),
    );
  }
}
