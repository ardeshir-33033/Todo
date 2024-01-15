import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/todo/presentation/manager/todo_list_bloc.dart';
import 'package:todo_list/features/todo/presentation/widgets/custom_loading_animation.dart';
import 'package:todo_list/features/todo/presentation/widgets/todo_items_widget.dart';
import 'package:todo_list/features/todo/presentation/widgets/todo_list_top_date_widget.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoListBloc, TodoListState>(
      listener: (context, state) {
        if (state is TodoListError) {
          Text(state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is TodoListSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                TodoListTopDateWidget(
                  selectedDate: state.selectedDate,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                      key: const Key("TodoList"),
                      itemCount: state.todoList.length,
                      itemBuilder: (context, index) {
                        return TodoItemWidget(todoItem: state.todoList[index]);
                      }),
                ),
              ],
            ),
          );
        } else {
          return const CustomLoadingAnimation();
        }
      },
    );
  }
}
