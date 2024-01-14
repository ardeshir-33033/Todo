part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListState extends Equatable {
  @override
  List<Object> get props => [];
}

class TodoListInitial extends TodoListState {}

class TodoListLoading extends TodoListState {}

class TodoListSuccess extends TodoListState {}

class TodoListError extends TodoListState {
  TodoListError(this.errorMessage);

  final String errorMessage;
}
