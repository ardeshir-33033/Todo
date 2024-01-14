import 'package:todo_list/features/todo/data/models/todo_item_model.dart';

abstract class TodoRepository {
  Future<List<TodoItemModel>> getLocations();
}
