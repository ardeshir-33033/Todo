import 'package:flutter_test/flutter_test.dart';
import 'package:map_ws/core/base/environment.dart';
import 'package:map_ws/features/map/data/data_sources/location_data_source.dart';
import 'package:map_ws/features/map/data/repositories/todo_repository_impl.dart';
import 'package:map_ws/features/map/domain/repositories/locations_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../data/data_sources/location_data_source_test.mocks.dart';

// @GenerateMocks([LocationsRepository])
void main() {
  late LocationDataSource mockDataSource;
  late LocationRepositoryImpl locationsRepository;

  setUpAll(() async {
    await Environment.initEnvironment();
    mockDataSource = MockLocationDataSource();
    locationsRepository = LocationRepositoryImpl(mockDataSource);
  });

  group('Locations Repository Test', () {
    test(
      'should return Exception when get location repository is not successful',
      () async {
        //arrange
        when(locationsRepository.getLocations()).thenThrow(Exception());
        //act
        final call = locationsRepository.getLocations;
        //assert
        expect(() => call(), throwsA(const TypeMatcher<Exception>()));
      },
    );
  });
}
