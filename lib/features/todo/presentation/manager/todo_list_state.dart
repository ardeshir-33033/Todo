part of 'todo_list_bloc.dart';

abstract class TodoListState extends Equatable {
  final DateTime selectedDate;

  TodoListState({DateTime? selectedDate})
      : selectedDate = selectedDate ?? DateTime.now();

  @override
  List<Object?> get props => [
        // selectedDate,
      ];
}

class TodoListInitial extends TodoListState {
  TodoListInitial(DateTime? selectedDate) : super(selectedDate: selectedDate);
}

class TodoListLoading extends TodoListState {
  TodoListLoading(DateTime? selectedDate) : super(selectedDate: selectedDate);
}

class TodoListSuccess extends TodoListState {
  final List<TodoItemEntity> todoList;
  TodoListSuccess({required this.todoList, DateTime? selectedDate})
      : super(selectedDate: selectedDate);
}

class TodoListError extends TodoListState {
  TodoListError({required this.errorMessage, DateTime? selectedDate})
      : super(selectedDate: selectedDate);
  final String errorMessage;
}
