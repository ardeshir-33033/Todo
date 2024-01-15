import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final tLocationModel = TestModels.testModelForLocation;

  test(
    'should be a subclass of location entity',
    () async {
      //assert
      expect(tLocationModel, isA<LocationEntity>());
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
        LocationModel result = LocationModel.fromJson(jsonMap);
        //assert
        expect(result, isA<LocationModel>());
      },
    );
  });
}
