import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';
import 'package:todo_list/features/todo/domain/use_cases/get_todo_list_usecase.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodoListUseCase getTodoListUseCase;

  TodoListBloc(this.getTodoListUseCase) : super(const TodoListInitial()) {
    on<TodoListEvent>((event, emit) {
      emit(const TodoListLoading());
    });
    on<TodoListEventLoading>(_onTodoListLoading);
    on<TodoListEventSuccessful>(_onSocketSuccessful);
    on<TodoListEventFailure>(_onSocketError);
  }

  void _onTodoListLoading(
      TodoListEventLoading event, Emitter<TodoListState> emit) async {
    emit(const TodoListLoading());
    try {
      List<TodoItemEntity> todoList = await getTodoListUseCase(null);
      add(TodoListEventSuccessful(todoList));
    } catch (e) {
      add(TodoListEventFailure(e.toString()));
    }
  }

  void _onSocketSuccessful(
      TodoListEventSuccessful event, Emitter<TodoListState> emit) {
    emit(TodoListSuccess(event.todoList));
  }

  void _onSocketError(TodoListEventFailure event, Emitter<TodoListState> emit) {
    emit(TodoListError(event.errorCode));
  }
}
