import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';
import 'package:todo_list/features/todo/presentation/manager/todo_list_bloc.dart';
import 'package:todo_list/features/todo/presentation/widgets/custom_loading_animation.dart';
import 'package:todo_list/features/todo/presentation/widgets/todo_items_widget.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('EEEE').format(state.selectedDate),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "${state.selectedDate.day} ${DateFormat('MMM').format(state.selectedDate)}, ${state.selectedDate.year}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
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
