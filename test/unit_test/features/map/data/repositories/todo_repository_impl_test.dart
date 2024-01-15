import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/core/base_routing/environment.dart';
import 'package:todo_list/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:todo_list/features/todo/domain/repositories/todo_repository.dart';
import '../../../../../fixtures/t_todo_model.dart';
import '../data_sources/todo_list_data_source_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late MockTodoDataSource mockTodoDataSource;
  late TodoRepositoryImpl repository;

  setUp(() async {
    await Environment.initEnvironment();

    mockTodoDataSource = MockTodoDataSource();
    repository = TodoRepositoryImpl(mockTodoDataSource);
  });

  group('get todo list', () {
    final tTodoList = [TestModels.testModelForTodoItem];

    test(
      'should return UserModel when create user is successful',
      () async {
        //arrange
        when(mockTodoDataSource.getTodoItems())
            .thenAnswer((realInvocation) async => tTodoList);
        //act
        final result = await repository.getTodoList();
        //assert
        verify(mockTodoDataSource.getTodoItems());
        expect(result, equals(tTodoList));
      },
    );

    test(
      'should return Exception when get todo is not successful',
      () async {
        //arrange
        when(mockTodoDataSource.getTodoItems()).thenThrow(Exception(""));
        //act
        final call = repository.getTodoList;
        //assert
        expect(() => call(), throwsA(const TypeMatcher<Exception>()));
      },
    );
  });
}
