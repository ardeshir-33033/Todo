import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/features/todo/data/models/todo_item_model.dart';
import 'package:todo_list/features/todo/domain/entities/todo_item_entity.dart';
import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../fixtures/t_todo_model.dart';

void main() {
  final tTodoModel = TestModels.testModelForTodoItem;

  test(
    'should be a subclass of location entity',
    () async {
      //assert
      expect(tTodoModel, isA<TodoItemEntity>());
    },
  );

  group('from json', () {
    test(
      'should return a valid model',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture("todo_model_test.json"));
        //act
        TodoItemModel result = TodoItemModel.fromJson(jsonMap);
        //assert
        expect(result, isA<TodoItemModel>());
      },
    );
  });
}
