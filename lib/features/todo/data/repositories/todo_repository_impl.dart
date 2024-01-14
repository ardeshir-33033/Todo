import 'dart:async';

import 'package:todo_list/features/todo/data/data_sources/todo_list_data_source.dart';
import 'package:todo_list/features/todo/data/models/todo_item_model.dart';
import 'package:todo_list/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  late final TodoDataSource todoDataSource;

  TodoRepositoryImpl(this.todoDataSource);

  @override
  Future<List<TodoItemModel>> getLocations() {
    try {
      return todoDataSource.getTodoItems();
    } catch (e) {
      throw Exception("Please try again");
    }
  }
}
