import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/core/base_routing/environment.dart';
import 'package:todo_list/features/todo/domain/use_cases/get_todo_list_usecase.dart';
import '../../../../../fixtures/t_todo_model.dart';
import '../../data/repositories/todo_repository_impl_test.mocks.dart';

@GenerateMocks([GetTodoListUseCase])
void main() {
  late GetTodoListUseCase getUseCase;
  late MockTodoRepository mockTodoRepository;

  setUpAll(() async {
    await Environment.initEnvironment();

    mockTodoRepository = MockTodoRepository();
    getUseCase = GetTodoListUseCase(mockTodoRepository);
  });

  final tTodoList = [TestModels.testModelForTodoItem];

  test(
    'should get todo list from repository',
    () async {
      //arrange
      when(mockTodoRepository.getTodoList()).thenAnswer((_) async => tTodoList);
      //act
      final result = await getUseCase(null);
      //assert
      expect(result, tTodoList);
      verify(mockTodoRepository.getTodoList());
      verifyNoMoreInteractions(mockTodoRepository);
    },
  );
}
