import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/features/todo/presentation/manager/todo_list_bloc.dart';

import '../../domain/use_cases/get_todo_list_usecase_test.mocks.dart';

main() {
  group('Todo List Bloc', () {
    late TodoListBloc todoListBloc;
    late MockGetTodoListUseCase mockGetTodoListUseCase;

    setUpAll(() {
      EquatableConfig.stringify = true;
      mockGetTodoListUseCase = MockGetTodoListUseCase();
      todoListBloc = TodoListBloc(mockGetTodoListUseCase);
    });

    TodoListBloc buildBloc() {
      return TodoListBloc(mockGetTodoListUseCase);
    }

    test('Initial state of TodoList Bloc is TodoListInitial', () {
      expect(todoListBloc.state, TodoListInitial(null));
    });

    blocTest<TodoListBloc, TodoListState>(
      'emits  when nothing is done',
      build: () => todoListBloc,
      expect: () => [],
    );
    //
    blocTest<TodoListBloc, TodoListState>(
        'The TodoListBloc should emit a TodoListLoading after TodoListEventLoading Event',
        build: buildBloc,
        act: (bloc) => bloc.add(TodoListEventLoading()),
        expect: () => [TodoListLoading(null), TodoListError(errorMessage: "")]);

    tearDown(() {
      todoListBloc.close();
    });
  });
}
