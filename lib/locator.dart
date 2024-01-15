import 'package:get_it/get_it.dart';
import 'package:todo_list/core/api_handler/api_handler.dart';
import 'package:todo_list/features/todo/data/data_sources/todo_list_data_source.dart';
import 'package:todo_list/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_list/features/todo/domain/repositories/todo_repository.dart';
import 'package:todo_list/features/todo/domain/use_cases/get_todo_list_usecase.dart';
import 'package:todo_list/features/todo/presentation/manager/todo_list_bloc.dart';

final locator = GetIt.instance;

void setup() {
  // *----- BLoc -----*
  locator.registerLazySingleton<TodoListBloc>(() => TodoListBloc(
        locator(),
      ));

  locator.registerLazySingleton<ApiHandler>(() => ApiHandlerImpl());

  // *----- UseCase -----*
  locator.registerLazySingleton<GetTodoListUseCase>(
      () => GetTodoListUseCase(locator()));

  // *----- Repository -----*
  locator.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(locator()));

  // *----- Data Source -----*
  locator.registerLazySingleton<TodoDataSource>(
      () => TodoListDataSourceImpl(locator()));
}
