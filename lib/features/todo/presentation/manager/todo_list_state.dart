part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListState extends Equatable {
  const TodoListState();

  @override
  List<Object> get props => [];
}

class TodoListInitial extends TodoListState {
  const TodoListInitial();
}

class TodoListLoading extends TodoListState {
  const TodoListLoading();
}

class TodoListSuccess extends TodoListState {
  final List<TodoItemEntity> todoList;

  const TodoListSuccess(this.todoList);
}

class TodoListError extends TodoListState {
  const TodoListError(this.errorMessage);

  final String errorMessage;
}
