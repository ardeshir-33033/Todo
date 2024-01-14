part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListEvent {
  const TodoListEvent();
}

final class TodoListEventLoading extends TodoListEvent {
  const TodoListEventLoading();
}

final class TodoListEventSuccessful extends TodoListEvent {
  final List<TodoItemEntity> todoList;
  const TodoListEventSuccessful(this.todoList);
}

final class TodoListEventFailure extends TodoListEvent {
  final String errorCode;
  const TodoListEventFailure(this.errorCode);
}
