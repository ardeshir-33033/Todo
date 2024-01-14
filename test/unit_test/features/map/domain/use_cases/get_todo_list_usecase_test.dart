import 'dart:async';
import 'package:flutter_test/flutter_test.dart';
import 'package:map_ws/features/map/data/models/location_model.dart';
import 'package:map_ws/features/map/domain/use_cases/get_locations_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../fixtures/t_location_model.dart';
import '../repositories/location_repository_test.mocks.dart';

// @GenerateMocks([GetLocationsUseCase])
void main() {
  late GetLocationsUseCase getUseCase;
  late MockLocationsRepository mockLocationsRepository;
  setUpAll(() {
    mockLocationsRepository = MockLocationsRepository();
    getUseCase = GetLocationsUseCase(mockLocationsRepository);
  });

  final tLocationList = TestModels.testModelForLocation;

  final StreamController<LocationModel> testDataController =
      StreamController<LocationModel>();
  testDataController.add(tLocationList);

  test(
    'should get all locations from user repository',
    () async {
      //arrange
      when(mockLocationsRepository.getLocations())
          .thenAnswer((_) => testDataController.stream);
      //act
      final result = getUseCase(null);
      //assert
      expect(result, testDataController.stream);
      verify(mockLocationsRepository.getLocations());
      verifyNoMoreInteractions(mockLocationsRepository);
    },
  );
}
