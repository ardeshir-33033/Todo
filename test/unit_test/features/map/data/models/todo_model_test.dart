import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:map_ws/features/map/data/models/location_model.dart';
import 'package:map_ws/features/map/domain/entities/location_entity.dart';
import '../../../../../fixtures/fixture_reader.dart';
import '../../../../../fixtures/t_location_model.dart';

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
            json.decode(fixture("location_model_test.json"));
        //act
        LocationModel result = LocationModel.fromJson(jsonMap);
        //assert
        expect(result, isA<LocationModel>());
      },
    );
  });
}
