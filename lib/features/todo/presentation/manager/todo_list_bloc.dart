import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';
import 'package:todo_list/features/todo/domain/use_cases/get_todo_list_usecase.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final GetTodoListUseCase getTodoListUseCase;

  TodoListBloc(this.getTodoListUseCase) : super(TodoListInitial(null)) {
    on<TodoListEvent>((event, emit) {
      emit(TodoListLoading(null));
    });
    on<TodoListEventLoading>(_onTodoListLoading);
    on<TodoListEventSuccessful>(_onSocketSuccessful);
    on<TodoListEventFailure>(_onSocketError);
  }

  void _onTodoListLoading(
      TodoListEventLoading event, Emitter<TodoListState> emit) async {
    emit(TodoListLoading(event.selectedDate));
    try {
      List<TodoItemEntity> todoList = await getTodoListUseCase(null);
      add(TodoListEventSuccessful(
          todoList: todoList, selectedDate: event.selectedDate));
    } catch (e) {
      add(TodoListEventFailure(
          errorCode: e.toString(), selectedDate: event.selectedDate));
    }
  }

  void _onSocketSuccessful(
      TodoListEventSuccessful event, Emitter<TodoListState> emit) {
    emit(TodoListSuccess(
        todoList: event.todoList, selectedDate: event.selectedDate));
  }

  void _onSocketError(TodoListEventFailure event, Emitter<TodoListState> emit) {
    emit(TodoListError(
        errorMessage: event.errorCode, selectedDate: event.selectedDate));
  }

  selectDate(DateTime selectedDateTime) {
    add(TodoListEventLoading(selectedDate: selectedDateTime));
  }
}
