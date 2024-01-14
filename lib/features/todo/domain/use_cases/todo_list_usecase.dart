import 'package:todo_list/core/usecase/usecase.dart';
import 'package:todo_list/features/todo/data/models/todo_item_model.dart';
import 'package:todo_list/features/todo/domain/repositories/todo_repository.dart';

class GetTodoListUseCase implements UseCase<Future<List<TodoItemModel>>, void> {
  final TodoRepository todoRepository;

  GetTodoListUseCase(this.todoRepository);

  @override
  Future<List<TodoItemModel>> call(void params) async {
    try {
      return await todoRepository.getTodoList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
