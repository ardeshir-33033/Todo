part of 'todo_list_bloc.dart';

abstract class TodoListEvent {
  DateTime? selectedDate;

  TodoListEvent({DateTime? selectedDate})
      : selectedDate = selectedDate ?? DateTime.now();
}

class TodoListEventLoading extends TodoListEvent {
  TodoListEventLoading({DateTime? selectedDate})
      : super(selectedDate: selectedDate);
}

class TodoListEventSuccessful extends TodoListEvent {
  final List<TodoItemEntity> todoList;

  TodoListEventSuccessful({required this.todoList, DateTime? selectedDate})
      : super(selectedDate: selectedDate);
}

final class TodoListEventFailure extends TodoListEvent {
  final String errorCode;
  TodoListEventFailure({required this.errorCode, DateTime? selectedDate})
      : super(selectedDate: selectedDate);
}
