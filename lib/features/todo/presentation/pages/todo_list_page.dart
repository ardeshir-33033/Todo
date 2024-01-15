import 'package:flutter/material.dart';
import 'package:todo_list/core/extenstions/translate_extensions.dart';
import 'package:todo_list/features/todo/presentation/widgets/linear_calendar.dart';
import 'package:todo_list/features/todo/presentation/widgets/todo_list.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          tr(context).schedule,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Column(
        children: [
          Divider(),
          SizedBox(height: 100, child: LinearCalendar()),
          Divider(),
          Expanded(child: TodoList())
        ],
      ),
    );
  }
}
