import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/core/base_routing/environment.dart';
import 'package:todo_list/features/todo/data/data_sources/todo_list_data_source.dart';
import '../../../../../fixtures/t_todo_model.dart';
import 'todo_list_data_source_test.mocks.dart';

@GenerateMocks([TodoDataSource])
void main() {
  late TodoDataSource dataSource;

  setUp(() async {
    await Environment.initEnvironment();
    dataSource = MockTodoDataSource();
  });

  group('get Todo list data source', () {
    final tTodoList = [TestModels.testModelForTodoItem];

    test(
      'should return a todo list when get is successful',
      () async {
        //arrange
        when(dataSource.getTodoItems())
            .thenAnswer((realInvocation) async => tTodoList);
        //act
        final result = await dataSource.getTodoItems();
        //assert
        verify(dataSource.getTodoItems());
        expect(result, equals(tTodoList));
      },
    );

    test(
      'should return Exception when get todo list is not successful',
      () async {
        //arrange
        when(dataSource.getTodoItems()).thenThrow(Exception());
        //act
        final call = dataSource.getTodoItems;
        //assert
        expect(() => call(), throwsA(const TypeMatcher<Exception>()));
      },
    );
  });
}
