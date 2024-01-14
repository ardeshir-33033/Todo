import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:map_ws/core/base/environment.dart';
import 'package:map_ws/features/map/data/data_sources/location_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../fixtures/t_location_model.dart';
import 'location_data_source_test.mocks.dart';

// @GenerateMocks([TodoListDataSource])
void main() {
  late TodoListDataSource dataSource;

  setUp(() async {
    await Environment.initEnvironment();
    dataSource = MockTodoListDataSource();
  });

  group('get locations data source', () {
    final tLocationList = [TestModels.testModelForLocation];

    final StreamController<dynamic> testDataController =
        StreamController<dynamic>();
    testDataController.add(tLocationList);

    test(
      'should return dynamic stream when get location is successful',
      () async {
        //arrange
        when(dataSource.getLocations())
            .thenAnswer((realInvocation) => testDataController.stream);
        //act
        final result = dataSource.getTodoList();
        //assert
        verify(dataSource.getTodoList());
        expect(result, equals(testDataController.stream));
      },
    );

    test(
      'should return Exception when get location is not successful',
      () async {
        //arrange
        when(dataSource.getTodoList()).thenThrow(Exception());
        //act
        final call = dataSource.getLocations;
        //assert
        expect(() => call(), throwsA(const TypeMatcher<Exception>()));
      },
    );
  });
}
