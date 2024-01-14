import 'package:todo_list/core/api_handler/api_handler.dart';
import 'package:todo_list/core/api_handler/response_model.dart';
import 'package:todo_list/core/base_routing/routing.dart';
import 'package:todo_list/features/todo/data/models/todo_item_model.dart';

abstract class TodoDataSource {
  Future<List<TodoItemModel>> getTodoItems();
}

class TodoListSourceImpl extends TodoDataSource {
  final ApiHandler api;

  TodoListSourceImpl(this.api);

  @override
  Future<List<TodoItemModel>> getTodoItems() async {
    ResponseModel response = await api.httpGet(TodoListRouting.todoListRoute);

    List<TodoItemModel> todoItemList = response.data.map<TodoItemModel>((j) {
      return TodoItemModel.fromJson(j);
    }).toList();

    return todoItemList;
  }
}
